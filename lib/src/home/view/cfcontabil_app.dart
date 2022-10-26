import 'package:formulario/src/view.dart';
import '../../app/view/lista_empresa.dart';

class CFContabilApp extends StatelessWidget {
  const CFContabilApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListaEmpresa(),
      ),
    );
  }
}