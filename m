Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A8EDC77B61
	for <ath10k@archiver.kernel.org>; Fri, 28 Apr 2023 19:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OPSePfPxTt7AQKePO/Mg8mwLMbCMwS6yoGTI7LLLDsE=; b=4NVG6PtywcGTm1
	llFFru5HNGws8ZWCjX3mStj5Pt5ALO5ndcpENxVMymJX8UTEdyGZCUqD1ZQQv/Jn8lSZDNk7Mkh4v
	Lu8651RAJ07rdR9ANJhEDw3aIiLqLyP/Sj7t55dMJ0sHHibdnB59VqkOQpOMxP1z6XVpcZpz1YeyL
	x0P1yLLNtQ4HIg/0OixkdGUF1AYdeVONUVfQ1dF5eEFX64c6aRENk5XnFYQsgqsmGSAIgfSCxxY4e
	NtXHP8rIDJAko4tvhN7YaeNzVMnbdP7SzT4xAUv6V1IEWY+837J2kWe5J4IMzjk/dcYcqITU44uGm
	uWPdx8S9o7ttqM0QWWTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psU43-00Begw-1Y;
	Fri, 28 Apr 2023 19:47:31 +0000
Received: from mail-co1nam11on2072f.outbound.protection.outlook.com ([2a01:111:f400:7eab::72f] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psU41-00BegU-0Y
	for ath10k@lists.infradead.org;
	Fri, 28 Apr 2023 19:47:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ApTpUO2cFlyC1FQhC0J+wfJc2XcBBhtNJ8vkOGZpzyu2shXyRdppMqw2oD79z6z5P1g7UXyaQWDsse0Bq9mY5ARcf2TsvqLjYPnKDo836ooagZp8PkCW4lfSrc97yL7rZaov8TEvUYk3UzQlrpxFcwPuicj3FFsVicdqy3RLe6FIY+h/hIUgLYBAY48v/BLdCSghjLQO8fm/ErgmKrhumU0gHj+h5XMzg1UHvqEf1Icwu3hn6X7NLQ9qMUTcaKhcwm7e1PP8b6j+gWA2RAwJJOa+ZQyGJrCz6cDfZ8lpznhZirSaDVZIKOpSswzMfWzx2KcJcpNXYKFrkOKYI6VD2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RaFl4fqMIYsj9k8l7A1XUu8w29DTpzfQPosA5TF2tMw=;
 b=PKppm9prbd2EOdNlK+XcNN1SdqFA56wQWRgzjNy445InnLcIkujln9YAr9Ypzk46t5vDYiO3BMc/5el9LCUrmLO7KsppdaSE5AjNL+2oPIxnDzQMg7fZHJhzLs0OpYmq13fVFpFLKZwptQZCQF0oyGiZdiTJ1S1BhwS0cjcYbCfOvPvJWhZ7LEB9kemHylA4RmfIu9RaQc133ZHpNYLlm/g2LUIy6rig/EeCLmPInzePtVhCN2ryaPaWMi5DSfhshEoyxcvcbEchhrHGRnAHWHtxjukSOgsg3giE98MUsQgkRnpZU4zibfgrFPtQ/2xox0RTIkcV91VvzLxAbUqlew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RaFl4fqMIYsj9k8l7A1XUu8w29DTpzfQPosA5TF2tMw=;
 b=oH4vLaEjNZOAfQBJvXPFIcavxJ77oj9ken4Vl7nzJi6Y6V/OPo2ilB2oCN/uJpZuKyqPY6J2GJex6DX3Di+l/h0Ld/oNDVQgsQ9QOidW6Q0TtB2UE13P3uViajHFK18ZlejNBoTelEfz5OxyA8ALPtDEXEShiutfyDqiElh5or8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by DS7PR13MB4752.namprd13.prod.outlook.com (2603:10b6:5:3a4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.22; Fri, 28 Apr
 2023 19:47:23 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::f416:544d:18b7:bb34]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::f416:544d:18b7:bb34%5]) with mapi id 15.20.6340.022; Fri, 28 Apr 2023
 19:47:23 +0000
Date: Fri, 28 Apr 2023 21:47:15 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Kalle Valo <kvalo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH net-next] wifi: ath10k: Use list_count_nodes()
Message-ID: <ZEwiw+zPc7Wdyixf@corigine.com>
References: <e6ec525c0c5057e97e33a63f8a4aa482e5c2da7f.1682541872.git.christophe.jaillet@wanadoo.fr>
Content-Disposition: inline
In-Reply-To: <e6ec525c0c5057e97e33a63f8a4aa482e5c2da7f.1682541872.git.christophe.jaillet@wanadoo.fr>
X-ClientProxiedBy: AM9P193CA0006.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:20b:21e::11) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|DS7PR13MB4752:EE_
X-MS-Office365-Filtering-Correlation-Id: 14456666-8ee1-47d2-2b73-08db482162ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	uXAQ5g7KFywjQGWKrzVfFcx8OmHxeICAOBvUeauFiu+iNiULf9Bq1qsWhY+8L5Jh21qK9/NGOPo1tkrTzHpIjAlMPcM8GhGl7bnkX8xliU3FRpUnxyLiz2+ja3vTqY0yANrFEnEStWd4l/+VKU7gquCuOL7Z+OzC6lxUWn8JoncpP4EmpsOoYYktPclw6Njl4ayeg697l2/7TdI0BjkzhOPmV2csMVRrSD69ZNoZ4XmOC69ZzbW80pOoG4N0PZPMb7L9VnvhLaDcbf9jsX9tCu0HzStrUN0dAeDFXHoNAWz+1EhMT5nAa7soE8j4hdesOaj0aTdLGzNgODM3HHmVvXYg1hIOLQl5bBZ9geH/XsixBliyEARmOJaNE0fqEyre89meuh8FOCzrV+iAyKu2cEYwYlN0+rPMj5X6Vaam/ufmUPDhLgl9BQQXV3LtC3Vjx31sTmDFyobTP4m/AVZUgR3tgl7WV6hJGcUtq4tSHqtMU++PM1DQySbsydweoJNLFxSCdDxe6/F5ksgmqo7JuuskwENaYquyZWytTM5o9/M0/1tFP60in5aobJ3ZrH/yKBZWqSrnHDjLzUFoeEZTN8v8q1B9WbC3Kk9FhhG5istgJUF66gqjKyqXP1nSexBZZNHKAOikpAuaHyBVsPpU0w==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB4842.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39840400004)(366004)(136003)(346002)(451199021)(86362001)(4744005)(2906002)(36756003)(44832011)(186003)(6486002)(6666004)(6512007)(6506007)(66556008)(4326008)(6916009)(2616005)(478600001)(66476007)(316002)(5660300002)(38100700002)(41300700001)(66946007)(54906003)(8936002)(8676002)(7416002)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?HmNHl4RPj92g1vhf4WQAgv3QcIE6ZEzZdgxb9HCKTv93e5YD190iyxlDw5uJ?=
 =?us-ascii?Q?c2Yrke+T/ZZPVhiJZR5Va23aem8D5l42h6wDFJtWVSB76NpWLpfeHDX4tPI6?=
 =?us-ascii?Q?F4xnrRfIFWGUHHcIRnCMqiCgElcihBOD4TuimeltVjYpvN0nUet4rlCoHd+J?=
 =?us-ascii?Q?vkemYcPSvqgCEWcRkIz2Li7I90k/mUDVYOIHIkSAfKKxtMSkkDeVHDMAFNbA?=
 =?us-ascii?Q?ZzdjKQPPVI5I++ysV9UeJ3LKO7gopZLUiTGlmdI+sVCA9C9hXsIVrQS0Mvzo?=
 =?us-ascii?Q?wHrCosrNLUU+HVrV3U+A2VAIiWX4DacFAAchQvug5YIRlUVhffVrxYKYPgt7?=
 =?us-ascii?Q?U19anPUtnJnvbuukDyIrwktuPIjZy0RpfDNJmWdmHmh9GYmUZmITGG0Y1+Qk?=
 =?us-ascii?Q?7ZKuLnmZ+JYfafh3DNXOn/RREuAtnzMOMZc9ZWSP5Zf8z74L8z7V3ewWptsK?=
 =?us-ascii?Q?EUbE76WMikINX7xVpq+E10+6J24GD0Ki1GniV7sXs8eNHrZsdhBNPAS+3uZC?=
 =?us-ascii?Q?9jY43DlPq4nviiyjYHS9itbGQftPqCzA7QQGylmeIFLOhA4WSJw9Dczq5yFk?=
 =?us-ascii?Q?h3+HgDqe43CUG1GJbAGC8GZx9ENF3QBj+mNYuyHOBqw2HO9jroZxA1ll20WI?=
 =?us-ascii?Q?t7s4+RdhjwirlJzTZznyNDNStSbQvDnGDKl0PykuHB1UCMtPekcfo0s8ydl6?=
 =?us-ascii?Q?YL0kCJ6R6ZfF+X4H5NeFpaq/ZJdMm9bnGutk0C5niID36AQtPhsbuYPKysfZ?=
 =?us-ascii?Q?P5UcJ3UPKlJ6u0Rk+XLYaqZuUWZW4u+1/GhG1qRWBBcWdiDfN2KTVbV14kYg?=
 =?us-ascii?Q?zcPjwlHQ+KBxCWOV+9YlXWZ+AkRBvV27h7b/FLtTCzQc7U6pMZ82osnfXaQt?=
 =?us-ascii?Q?cSO2OKzXIOLxNDWn+QNVIT9+3JUa06LE0CpPse1O7MMiF8f5gCBK2FcljiHL?=
 =?us-ascii?Q?PU2C1b3gUhsEIO8svd0zGJFb7Br4RYMShivfeGQ26FCpVSaFX1xKlIxQrDIt?=
 =?us-ascii?Q?3OkXL1EDqXJd8q+EC739lX5biB1QiPrAugjCQ0iXj/Z4vGCBhPAqUrLwAcVS?=
 =?us-ascii?Q?irWMxmfWqoM9rheR4EfJDAd52qIz0rA0wnuiIuvFvZ0dQIEWoCEs4U6uS9Fb?=
 =?us-ascii?Q?QKKPQIEba5o1uvtzsYeTRsMuYY1G8bq+J24BgaJKX1vBP5yrPFIVtdvZAJHQ?=
 =?us-ascii?Q?Ibu5qjB2Gjv1W3uFYTE7X8YyNx+G3ozkWXvYB9Xvn/cGxXS7ivj1aRVpgy/r?=
 =?us-ascii?Q?hxE/Bxw1ai4KSwhVXnzeVEunuE1emckXlt4pQTraRwgMEd6d1AFIOhJo5XSa?=
 =?us-ascii?Q?PY7do0G/LwAXCqc+Ah8UbOozWXsq91XhfXb7/lxHet7S093bEp7HXCXatGc3?=
 =?us-ascii?Q?vvD+CcyQj+YLqUBN8Ae8MAKCdqXt8bmZAhqoZVQmC/rnHc4mfjLl720GP+5R?=
 =?us-ascii?Q?06ZaaGk0ANl+4Z+PBJ/hTMEQIpvdlOwCzLD4aDfLP8n8IQNblScHFPNnf3rY?=
 =?us-ascii?Q?6NWW4V5dXgMDn5o+JgVVWNe6f/WNMgsAZPzJxynP7TWaQ9MgsgHyEEOqAoXv?=
 =?us-ascii?Q?5Y5dN3fznFmoPAlOKavLQLweSrv2HMM3sPv0YL2eF3Id5Ywxh1fAKva5xr7d?=
 =?us-ascii?Q?PUzevG8fdyvI9rl91Gh2gaD4SOR05y8l9XEXQsyiSBb91xKU1rPl5BbAntzl?=
 =?us-ascii?Q?Yk+YiA=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14456666-8ee1-47d2-2b73-08db482162ba
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2023 19:47:23.2073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MSWPTu+lAtrWK3G64Tia3etA7gEsDw4UNWdlGPelNAbGMmV/dtsaHocrW40Kpqc+i4fXW/J3BOWRvmx8zCH9VQIqatnsvaaEqnxh2j2FFlk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR13MB4752
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_124729_210808_87CC4E95 
X-CRM114-Status: UNSURE (   8.49  )
X-CRM114-Notice: Please train this message.
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

On Wed, Apr 26, 2023 at 10:49:07PM +0200, Christophe JAILLET wrote:
> ath10k_wmi_fw_stats_num_peers() and ath10k_wmi_fw_stats_num_vdevs() really
> look the same as list_count_nodes(), so use the latter instead of hand
> writing it.
> 
> The first ones use list_for_each_entry() and the other list_for_each(), but
> they both count the number of nodes in the list.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Simon Horman <simon.horman@corigine.com>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
