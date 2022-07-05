Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA25FC43334
	for <ath10k@archiver.kernel.org>; Tue,  5 Jul 2022 00:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7r3/IiwgHOYuTQFiOHbDzcs4YrBCbMxfjDZHhSPdKyU=; b=g7iHBXaaeYAfzs
	24nX//S+b/RtctuyXn5hFMSWTay+AKGoX89JdEIkhP19EqvsoYDAbdnkZ5hxOUCh0HlANmZBZu3uh
	vYfycgSd/KIRdWp7VDUEAWYmkNfX+fwFT2lp3g51OTnkZfTsQT5XFccwJ0ajUuCTsmm1TvSf7bYSY
	jt+l2alxJzZB18AG/FuDgtrIzv07mKFG6gGcrsRuBPn4eOKCi5QP14GIy6Ypq3EQ9JJWUJzqW0YwR
	ZTJuReK2XyasUCVdEX+2q0XzfS9s42vt8xwxVKzky6aKpoS0xuh8nDnTsECiJBsdyCN4INIURjRPw
	WD7vZJdPtRKEScUBDU4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8WCd-00DMdp-Hp; Tue, 05 Jul 2022 00:14:07 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8WCa-00DMZN-5m
	for ath10k@lists.infradead.org; Tue, 05 Jul 2022 00:14:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656980044; x=1688516044;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=JWhNbg+n2LfqLLWnzXXC1g8411ZNN0MpB2NsifplHeM=;
  b=HOd32ERS+s1pl0KDKWzBK9evQ7mphjSFNLx/RAZGWFwpUTvGi6FalqUN
   G5uAWk0ILlMaSeROWnu8AM7N2Rad2XhXrMHcfV8O+9jKjGO3Ucf/PmT6p
   dXyk5ANEc5zymqQczY6EHvQ0Cg3NMnhVjUIEALMhPivgnQRh9UxLkVGmB
   ER6g6xmBG7tuWVaiMsw+noJvs42KaUe+FYmtMv8Q7amQnha5Og1h4kRho
   ZH1zryL/trDiLvy7oLTihZBNBh0dY2xVn2z64tWnCX+erCkv1lXDbwdNz
   IFWlu+ICC3wQbndyihgPqml2T+rhQgklXkUM6XX70c/UpDyihxayzsm1x
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="263637156"
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; 
   d="scan'208";a="263637156"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2022 17:13:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,245,1650956400"; 
   d="scan'208";a="734956150"
Received: from lkp-server01.sh.intel.com (HELO 68b931ab7ac1) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 04 Jul 2022 17:13:49 -0700
Received: from kbuild by 68b931ab7ac1 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1o8WCK-000ISx-SY;
	Tue, 05 Jul 2022 00:13:48 +0000
Date: Tue, 05 Jul 2022 08:12:59 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup] BUILD SUCCESS WITH WARNING
 935b5c199249cdfb6c1812a328cb69e2873b8c11
Message-ID: <62c3820b.TUBLP5TaXVDQiQAc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220704_171404_258658_7C48CB5E 
X-CRM114-Status: UNSURE (   4.60  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath12k-bringup
branch HEAD: 935b5c199249cdfb6c1812a328cb69e2873b8c11  ath12k: hal: move ops to hw_params

Warning: (recently discovered and may have been fixed)

drivers/net/wireless/ath/ath12k/dp_rx.c:2693:29: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/net/wireless/ath/ath12k/dp_tx.c:569:35: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/net/wireless/ath/ath12k/hal_rx.c:406:25: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-allyesconfig
|   |-- drivers-net-wireless-ath-ath12k-dp_rx.c:warning:cast-to-pointer-from-integer-of-different-size
|   |-- drivers-net-wireless-ath-ath12k-dp_tx.c:warning:cast-to-pointer-from-integer-of-different-size
|   `-- drivers-net-wireless-ath-ath12k-hal_rx.c:warning:cast-to-pointer-from-integer-of-different-size
|-- arm-allyesconfig
|   |-- drivers-net-wireless-ath-ath12k-dp_rx.c:warning:cast-to-pointer-from-integer-of-different-size
|   |-- drivers-net-wireless-ath-ath12k-dp_tx.c:warning:cast-to-pointer-from-integer-of-different-size
|   `-- drivers-net-wireless-ath-ath12k-hal_rx.c:warning:cast-to-pointer-from-integer-of-different-size
|-- i386-allyesconfig
|   |-- drivers-net-wireless-ath-ath12k-dp_rx.c:warning:cast-to-pointer-from-integer-of-different-size
|   |-- drivers-net-wireless-ath-ath12k-dp_tx.c:warning:cast-to-pointer-from-integer-of-different-size
|   `-- drivers-net-wireless-ath-ath12k-hal_rx.c:warning:cast-to-pointer-from-integer-of-different-size
`-- powerpc-allmodconfig
    |-- drivers-net-wireless-ath-ath12k-dp_rx.c:warning:cast-to-pointer-from-integer-of-different-size
    |-- drivers-net-wireless-ath-ath12k-dp_tx.c:warning:cast-to-pointer-from-integer-of-different-size
    `-- drivers-net-wireless-ath-ath12k-hal_rx.c:warning:cast-to-pointer-from-integer-of-different-size

elapsed time: 787m

configs tested: 50
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm                              allyesconfig
arm64                            allyesconfig
m68k                             allyesconfig
m68k                             allmodconfig
arc                              allyesconfig
alpha                            allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
sh                               allmodconfig
mips                             allyesconfig
i386                             allyesconfig
i386                                defconfig
i386                          randconfig-a001
i386                          randconfig-a003
i386                          randconfig-a005
x86_64                        randconfig-a015
x86_64                        randconfig-a011
x86_64                        randconfig-a013
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arc                  randconfig-r043-20220703
s390                 randconfig-r044-20220703
riscv                randconfig-r042-20220703
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                           allyesconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit

clang tested configs:
x86_64                        randconfig-a005
x86_64                        randconfig-a003
x86_64                        randconfig-a001
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
i386                          randconfig-a015
i386                          randconfig-a011
hexagon              randconfig-r041-20220703
hexagon              randconfig-r045-20220703

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
