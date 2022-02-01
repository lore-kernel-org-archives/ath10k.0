Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7335C433F5
	for <ath10k@archiver.kernel.org>; Tue,  1 Feb 2022 13:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Jw2CDbi2ZEvRbbkzKr98T6v3DPDZbytLEfUVpxTMlfc=; b=PHjrsS7IsRbOGS
	oLB7iO475fwaetFwg6nPkq/XOO+I/v4eZbtRfHpbCRL7+NNEqDg5gdDplpjADyV44PMYx8npDXOgM
	8JTrOHYY0RxnZi9HAApXYWqiIzMC4I7Pebvqxfl36tUn59ZkjLpuZeovh/kS8iH10R5DQi2xT3Z6F
	IKyt0MWhmyKl5aZSL0yOOt9Dc2ZPhjcAhIbcLieMaFHfdcySyImj66r7iMp8mY6FBAqDCQ6urk4d3
	wS/50Lt6hnN6irlSB/RWxWyPs7DUwU30l7BBa+tBz4roQoYgBreeCktlF/o6W5kLd8zaY3DswT5Zj
	itADnFWOQIN2Aj/gveJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEsuM-00CJ3a-AZ; Tue, 01 Feb 2022 13:09:18 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEsuJ-00CIza-BN
 for ath10k@lists.infradead.org; Tue, 01 Feb 2022 13:09:16 +0000
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 211BJJui031329; 
 Tue, 1 Feb 2022 13:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=05WNsyFIG6gZKLB4QT1csdMz1Dn2crmtbLjzSiN5wTA=;
 b=F8XfnffQFo8YeKOY+l33MdFesayPulV9+iNmniwszZIPh6MLXQ0qEyK4sOXq4VdTMcVd
 51toWh9+fdytEupEgVO20sS8Xh+QtGtP4k21kWTAT7otT/Hg0oT+0kZ2R9pvfRjsqGOr
 rLnfPi/EqoFfH5qKEY8yZxiu00zEb4BSI+DmMplE8VqTxiBqYn00e+M5F7LIT+FTWoMf
 34B6WM/C/7Jb02xKtTbGuIRDCPMtvAExAU+cA0Siulze1ZDXsY9xiZ6Zex3MX1gYaMVQ
 GyBgzZrJOBEOvrSFM2ze1YU/WNN1cOvDum2VO5/tlJ7Hx+lczH4YP2vztCcpLs5zQH4J 3g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dxjattxd1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Feb 2022 13:09:13 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 211D1Mlc130114;
 Tue, 1 Feb 2022 13:09:12 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
 by userp3030.oracle.com with ESMTP id 3dvtq09cfc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 01 Feb 2022 13:09:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BoQm4lwHjR3yfbEN37H2wo0V7TKS93XN960C0Uf4Ncm5/vBiiAMV35RTIbGqJ3heE84UQlD23UlHp27r2Yd94un3C/8XMtknfGEoq1o6XEkZeO7gtVIFAaSI9XZk/sb0bqsUqKoIuTEsWvhDtP80qH/VAsNallYlzGXIaTgPleEaQFuTDK8pdWGtpUuWa92Sy2dUJg4xOY5wI7z4kUzryd/J5OkKpqLIPoRLrj+hu4fm2xtXYFyQnl4Iyq24+YyX18zMtXdwqYCYonjSfYxRxQFyLz6cf+estFtPloegIGAGdSq5zGUxJP5xiGWQYWA0juI9F7zzAA/WzTDV+7kpcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05WNsyFIG6gZKLB4QT1csdMz1Dn2crmtbLjzSiN5wTA=;
 b=f0L4h2bLEgHs1z47mh3NBoYGXL4yzTTy6+w1W1z49NX16H/ykuGyl44O71dAPQ4tAj5XGX/rFj986gpp0xM9bZryrZoBCnmLA0PBRPeXRK2VdrSrLyKO/MgDgB1Yaa5boVeWUuzhyegoIT5GUu8TD4vFv3CiWqt2mmgz9jJilzht2rD0ywpfO0ph+6tv9MJVq9UafjZd4gXwJS0eyCtWWkxNP2/vvMhgVyWbTluJrYgEpVzCsoPcgxLkbWU4BeDD1WJc2TAefkfl2AkjLfOV3ty/+tviYSG44/qxDEllX9T/EEjHF9aEjy/EUQDcD3qzZ11AON6yah/27agCwQwSoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05WNsyFIG6gZKLB4QT1csdMz1Dn2crmtbLjzSiN5wTA=;
 b=E3dzGXcOBbABsIBF4PoX20DthJTYbHtkHbd8O+duyj+qPFxpFKypq6EzgYT4VgzzJA5i4+CJm3OJZWmrfixuz4ggLgfMR5oPtsYilMzPMkCH6+PkecRMtbQQdOTsgpkzlC8RnPxiGwkDN4rNczvShy+SuYPZOO/RC0HSeXAbZJI=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DS7PR10MB5168.namprd10.prod.outlook.com
 (2603:10b6:5:3a0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Tue, 1 Feb
 2022 13:09:10 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8%5]) with mapi id 15.20.4930.021; Tue, 1 Feb 2022
 13:09:10 +0000
Date: Tue, 1 Feb 2022 16:09:00 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: franciman12@gmail.com
Cc: ath10k@lists.infradead.org
Subject: [bug report] ath10k: abstract htt_rx_desc structure
Message-ID: <20220201130900.GD22458@kili>
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0139.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::18) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c31fd8dc-f462-45e0-229c-08d9e5840930
X-MS-TrafficTypeDiagnostic: DS7PR10MB5168:EE_
X-Microsoft-Antispam-PRVS: <DS7PR10MB51688688C1A5AF6D59344E738E269@DS7PR10MB5168.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mHQqurUx4j39b1lTnlP0fBMl7ZvomOi+WJgH9sRtQqjXMKdBpGd2McpZsQSxa7+50o97RiqAyvghldR5PQOWXfMt7gICtuAT5o8L7n6a384+Qi58SbF4ZIdOkID9jn8T+SjmZ1bKlIBTHHRfDqhVdq4p/pcr8O2Bwub1vwYAfbt3sxzBJSdWKO0es59mAxuZI1lCODtysBqTPD2Ip72QVa7dLa3us3HnoL/odANIFNjsp+75tLScr8JL/tJdO4PspAAXKUp9fi/3G9580e0QKAx2yqctfaRodEBY5MlYpUeUsjlZ1xNnc/sEZATEoZd5BBalcrsB4YnsNN1J4lvCDXFiVHFU5AVN7hriE4b4aCZVzs52AQQZNxJU3KyWWQX7EaQkodB8xvXx+tDN5G+WNrAuw3g+S2eUHkq+uK7FV7ctMUgo9NnGE53bU5pRgKDbHOpN+sMecs1Q1LBlsWHRHQgMEQIibEafL1oWkKQTNTElnRBYI0H1bE6BlTiZK7lIGeiRCobL4rpt7INIRSGr5G95dtjz12bDVNt2NMOKxyBQUDC/PuBexyr66XfUzXhlEULn5v4rqdQGzghV1eTcfIenP4NmdADKvLLaA627lgyWyQ8oNcGWH467isDGVfgF5pl4AKn4JzZtoIs6eSIWD9eL/KcZBw7e2iq6UUA6L5cBTpeGCNUjQGoSkcVYoU/asiDJf6DbBXJCjQmsyzPhiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(66556008)(66476007)(508600001)(6916009)(86362001)(6486002)(316002)(33716001)(38100700002)(66946007)(4326008)(8936002)(8676002)(186003)(26005)(44832011)(2906002)(52116002)(6506007)(6666004)(1076003)(38350700002)(33656002)(6512007)(83380400001)(9686003)(5660300002)(20210929001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OrWghsUvR78keeaBxdkjO5zFKVrwtUvkRITa0Zm6WuQ4VpN4AVBD1ILwEjFf?=
 =?us-ascii?Q?52PGbRovE6SfgB8sPDJseSw91pzwhV488mZLKIj5tB2pNV6JXpPJk8WlOmtQ?=
 =?us-ascii?Q?i5ohNBb5yNuzFab6oUdI/lQS/zL26EhVMXxGFmuviYt2lT0A5PqRfgyGCNhQ?=
 =?us-ascii?Q?Mq3ED92JMJfclyzsTiT6oVs3UsKEOi8RNXNbFlM5+rSRZCQlqPCbRi9xmUOF?=
 =?us-ascii?Q?s8AZ6PVA8GQRAm7zQjPiccSnT1RvtspXXUAKWfWm46QmnhdCPrHGOaEjcVsa?=
 =?us-ascii?Q?9UzOR8To0l2kXhTM/GLUgMC6Zijsl4YHtnqm1fPYY9F/R+VOZI/P9djpiaQE?=
 =?us-ascii?Q?XhqTR43AnjfeTlmflXyMa92+Z2uDRwcvOtHqLcjyXdTN9ozw+7DaEsGXrLcv?=
 =?us-ascii?Q?GONJWsHB8zfaXqKKA8y7yrh81cbgOFZd2o8srBQuqZJirNz+VvLPX8+QF3bQ?=
 =?us-ascii?Q?r0VnrbkNfvNITaNQIPUuBRzNk2EbYa0FIX/1jHdR6yHeGj2PRcC9oeWeFyfh?=
 =?us-ascii?Q?75j4RhqSejO4boKz29snbNvcdN5Sk3O9ZjxgU1091STCNIiKWiFahYfrAl9V?=
 =?us-ascii?Q?24BqapFq49UMMjduqHL57FKVk7S5b7Zmyc0qdXRpUwPwfGpgiahZlpNYzTqb?=
 =?us-ascii?Q?9rS7rZez6WnGzkkDJ51ywn4Jnm1GdF4AbmSdl6+b8cfsMi/a6UR5zOSWcSXD?=
 =?us-ascii?Q?1hAOgK2dPTsqMCZCNhgjHksQGn0L4FcVehFJFYYYlkyCZvRedx5AMypuc/FR?=
 =?us-ascii?Q?e2y2UJUYr7Y3NSz3bSuuBhB6GtJwLnOu2e1LOngmTrERMas8dmHLSPCFE2A4?=
 =?us-ascii?Q?NHe1JCsQM16+69JTy8maFHtF7o4aEihpZDzFIVQ0KQ7xL/bVSray/knCmyNo?=
 =?us-ascii?Q?VL3yQWD+5VYLTIrO/7yd89sqb0UWBU3hRCeUSPwEuLR+67oMnOlJDxmrQzHM?=
 =?us-ascii?Q?cqovJax/kfk9zNqX4p9/wv1KvxHmIgVqSrMbYuHx47NKfmtKcKdkk8NRigOA?=
 =?us-ascii?Q?1cyqWHI1Qsc17bUpMkAojoSXDiGMt8ASLIRI/Gxcxza6N/UZfO2qhQjrzW9v?=
 =?us-ascii?Q?REIQZIeTPHxJmCc30N7PXu6SpNhmOKWCDO6hcMuGf1qxl43bzfOhU+b6gYwb?=
 =?us-ascii?Q?Y5c6qAtFxDIeT1k6GeGYh3V9evmZxDln6HTfQfPxpYdUHkNaAnbBlX8RoGHN?=
 =?us-ascii?Q?gz/AsCn0jQq0twRf7MnbpdFT6c+2+ICTAkNwoYeU77EAeOlBBg1zG7Edp4vO?=
 =?us-ascii?Q?jQs0R/ONp25D4JIHVg43uHSt7oF5ifOGGQZ/6xLKsxKupIRVRjjjls6zDeR8?=
 =?us-ascii?Q?jhgM/0EkVCQDtUguGQ8tgTBVEc0Oox6LSMamPLADIVWxxp7YHNbV8MZL0CdB?=
 =?us-ascii?Q?ALcqybh1Ds060Kia1Jk+rSaaW/Z5sh9mxr6tkvUB95Vm3rTPX99dGEnoQ08b?=
 =?us-ascii?Q?kwqNM/EoC24HZ0GMumxWLZcMbXtDZzp+q8VaL9qbebTBs3w9X2TJmTAljh0Y?=
 =?us-ascii?Q?2yT0Whb4gp0ncQmmGpEVYWrp0lhaVZlkElt/qu8zzihuF80uKJTvvm+HkNyJ?=
 =?us-ascii?Q?neC4mlohbBx9nwqRTWlj2HmcaoagAmWFqHLOcMnb4r7q8uBz3RUxFwPLIiko?=
 =?us-ascii?Q?mpovjhz2enLNqCWSon1hyMUb63+AlFpO/tcBY619lYMlZXMt8yyhzDZB2htf?=
 =?us-ascii?Q?X5Wo1NbrqwdewETjKByj/qd+hJs=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c31fd8dc-f462-45e0-229c-08d9e5840930
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 13:09:10.4885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iWqZZuTDE2v4Bk6TkPVURxph3cFVdxeAhAJ2w6eEblFsOLUWj3f7TUYqNjOeD5ymNJciDHDlpaAiz4DZcwL12wEuOmOP8V/HWEdp637jE00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5168
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10244
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=893
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202010072
X-Proofpoint-GUID: fOfs5p3wrc39QPJzSi8zmRDncN6UXn_h
X-Proofpoint-ORIG-GUID: fOfs5p3wrc39QPJzSi8zmRDncN6UXn_h
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_050915_457303_EDD74271 
X-CRM114-Status: GOOD (  11.72  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hello Francesco Magliocca,

The patch 6bae9de622d3: "ath10k: abstract htt_rx_desc structure" from
Jan 12, 2022, leads to the following Smatch static checker warning:

	drivers/net/wireless/ath/ath10k/htt_rx.c:432 ath10k_htt_rx_amsdu_pop()
	warn: potential pointer math issue ('rx_desc' is a 32 bit pointer)

drivers/net/wireless/ath/ath10k/htt_rx.c
    346 static int ath10k_htt_rx_amsdu_pop(struct ath10k_htt *htt,
    347                                    struct sk_buff_head *amsdu)
    348 {
    349         struct ath10k *ar = htt->ar;
    350         struct ath10k_hw_params *hw = &ar->hw_params;
    351         int msdu_len, msdu_chaining = 0;
    352         struct sk_buff *msdu;
    353         struct htt_rx_desc *rx_desc;
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    354         struct rx_attention *rx_desc_attention;
    355         struct rx_frag_info_common *rx_desc_frag_info_common;
    356         struct rx_msdu_start_common *rx_desc_msdu_start_common;
    357         struct rx_msdu_end_common *rx_desc_msdu_end_common;
    358 

[ snip ]

    427 
    428                 last_msdu = __le32_to_cpu(rx_desc_msdu_end_common->info0) &
    429                                 RX_MSDU_END_INFO0_LAST_MSDU;
    430 
    431                 /* FIXME: why are we skipping the first part of the rx_desc? */
--> 432                 trace_ath10k_htt_rx_desc(ar, rx_desc + sizeof(u32),
                                                     ^^^^^^^^^^^^^^^^^^^^^
This is a pointer math bug.  It's possible that it should be:

	trace_ath10k_htt_rx_desc(ar, (u8 *)rx_desc + sizeof(u32),

But as your FIXME notes, it's hard to tell what's going on here...


    433                                          hw->rx_desc_ops->rx_desc_size - sizeof(u32));
    434 
    435                 if (last_msdu)
    436                         break;
    437         }

regards,
dan carpenter

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
