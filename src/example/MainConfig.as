package example {
    import robotlegs.bender.framework.impl.Context;
    import robotlegs.bender.bundles.mvcs.MVCSBundle;
    import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
    import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
    import robotlegs.bender.extensions.contextView.ContextView;
    import example.mediator.GUIViewMediator;
    import example.view.GUIView;
    import example.model.ClockModel;
    import example.service.ClockService;
    import example.command.events.StartUpdateTimeEvent;
    import example.command.StartUpdateTimeCommand;
    import flash.display.DisplayObjectContainer;

    public class MainConfig {
        private var context:Context;
        private var mediatorMap:IMediatorMap;
        private var commandMap:IEventCommandMap;
    
        public function MainConfig(rootDisplayObject:DisplayObjectContainer) {
            // create robotlegs context
            context = new Context();
            // install the MVCSBundle
            context.install(MVCSBundle);
            context.configure(new ContextView(rootDisplayObject));
            //map view to mediator
            mediatorMap = context.injector.getInstance(IMediatorMap);
            mediatorMap.map(example.view.GUIView).toMediator(GUIViewMediator);
            
            // map command to event
            commandMap = context.injector.getInstance(IEventCommandMap);
            //This is step 3. "Context maps event #2 to a command" 
            //in the Class Diagram at http://www.robotlegs.org/diagram/ .
            commandMap.map(StartUpdateTimeEvent.START, StartUpdateTimeEvent).toCommand(StartUpdateTimeCommand);
            
            // map model as singleton
            context.injector.map(ClockModel).asSingleton();
            // map service
            context.injector.map(ClockService).asSingleton();
        }
    }
}
