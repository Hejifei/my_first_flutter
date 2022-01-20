//  开发环境
import 'package:myapp/src/common/index.dart';
import 'package:myapp/src/env.dart';

// const SERVER_HOST_DEV = 'http://192.168.1.119:8700/api/'; //  测试
const SERVER_HOST_DEV = 'http://192.168.221.137:8503/api/'; //  开发

//  生产环境
const SERVER_HOST_PRO = ''; //  测试

const ENV_IS_DEV = ENV == ENV_DEV;

const SERVER_API_URL = ENV_IS_DEV ? SERVER_HOST_DEV : SERVER_HOST_PRO;
