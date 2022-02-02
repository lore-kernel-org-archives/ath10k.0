Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FF0C433EF
	for <ath10k@archiver.kernel.org>; Wed,  2 Feb 2022 08:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rn6kT3iE0uk63SgIPewG9J1LWT+1SW/hqSlovvpeqLo=; b=1ZPRVEnhbp97UP
	PH6EvWwjejhlfDBgnf2AzFEeZOlpw4xaOEHSWuRZKecuv/br39p95gwg59Y65KynygQ+ujhLNFMh4
	9fWqSwDNNOQ6Q5JPZfMzLYq2DcRrljp0sLtzBHZIhGJzru1SoVKH3mtwlx+fR7Nh3xJ4F8O2fUw6N
	GR9d6GJkzFuVynXTXVb55J+/yPCi1Ux66/CErNDcRfkngsBB3r0TMhkdMhI1l7HGTXVhzQjegqrJd
	K9SzlATNmaHi0bv9iYIlYilIfJk1Tt3xONh9kY92MPWgbjQclihbProiDVh6wLCr4bPdZejuZ5A13
	XeFVlGeOuhd9vHXnu1ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFAsp-00EYjN-Jx; Wed, 02 Feb 2022 08:20:55 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFAsl-00EYgw-14
 for ath10k@lists.infradead.org; Wed, 02 Feb 2022 08:20:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643790051; x=1675326051;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=pfI7PH+IN+/vd3VxOPHvdgABhJeOZ02lTdvGOczisoM=;
 b=aH3rThhe/7B9uilItglnp2FFPkpfZexY7AQUnoGyNcKCbjIkPFAGCoOy
 gygnmv4OE3Br4nc/MFlimXwMKrjFaxBvPi8Ul+zZXY60DiTyfmjMAy1Ol
 Ixyo4pF7KupU2PaINio3O6Xo94TBsZs7lHfR2cWtD3sWiS3hB1od4fXjW
 hU+DLyn5lQnB01+yQf3Kdp4jrOHtmlnAcARtQxJdkicKVevmpVRFvfh7b
 IWMM6pprUXL2MsQcb+6/eXdhPcfUoc++fHbn7uddYQSLEDS0ljy3nUezY
 2znuaoVnLJuoF9wdWrIx0FDrBjekYBpC+vpteRSUaNLpuRAx3YWiZbrdC w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10245"; a="235267184"
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="235267184"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2022 00:20:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,336,1635231600"; d="scan'208";a="523412978"
Received: from lkp-server01.sh.intel.com (HELO 276f1b88eecb) ([10.239.97.150])
 by orsmga007.jf.intel.com with ESMTP; 02 Feb 2022 00:20:48 -0800
Received: from kbuild by 276f1b88eecb with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1nFAsh-000ULN-Qb; Wed, 02 Feb 2022 08:20:47 +0000
Date: Wed, 02 Feb 2022 16:20:26 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath12k-bringup] BUILD REGRESSION
 f40abb4788a2a3868606a29d99583421e0874350
Message-ID: <61fa3eca.CCqyBamwrelCA/cE%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_002051_193198_62B87935 
X-CRM114-Status: UNSURE (   6.12  )
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
branch HEAD: f40abb4788a2a3868606a29d99583421e0874350  ath12k: New driver for Qualcomm 11be hw family

Error/Warning reports:

https://lore.kernel.org/lkml/202202020753.GUB2VYGh-lkp@intel.com
https://lore.kernel.org/lkml/202202020835.JgAG7kJa-lkp@intel.com

Error/Warning in current branch:

drivers/net/wireless/ath/ath12k/debugfs.c:250:13: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
drivers/net/wireless/ath/ath12k/dp_mon.c:1902:32: warning: implicit conversion from 'enum hal_rx_mon_status' to 'enum hal_tx_tlv_status' [-Wenum-conversion]
drivers/net/wireless/ath/ath12k/dp_rx.c:2739:15: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/net/wireless/ath/ath12k/dp_rx.c:2739:29: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/net/wireless/ath/ath12k/dp_tx.c:605:14: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/net/wireless/ath/ath12k/dp_tx.c:605:35: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/net/wireless/ath/ath12k/hal_rx.c:404:25: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
drivers/net/wireless/ath/ath12k/hal_rx.c:404:4: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]

possible Error/Warning in current branch (please contact us if interested):

drivers/net/wireless/ath/ath12k/dp_tx.c:1074:9: warning: shift count >= width of type [-Wshift-count-overflow]
drivers/net/wireless/ath/ath12k/dp_tx.c:1074:9: warning: shift count is negative [-Wshift-count-negative]
drivers/net/wireless/ath/ath12k/pci.c:667:14: error: implicit declaration of function 'of_property_read_u32' [-Werror=implicit-function-declaration]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-net-wireless-ath-ath12k-debugfs.c:warning:assignment-to-void-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-net-wireless-ath-ath12k-dp_mon.c:warning:implicit-conversion-from-enum-hal_rx_mon_status-to-enum-hal_tx_tlv_status
|   `-- drivers-net-wireless-ath-ath12k-pci.c:error:implicit-declaration-of-function-of_property_read_u32
|-- arc-allyesconfig
|   |-- drivers-net-wireless-ath-ath12k-dp_mon.c:warning:implicit-conversion-from-enum-hal_rx_mon_status-to-enum-hal_tx_tlv_status
|   |-- drivers-net-wireless-ath-ath12k-dp_rx.c:warning:cast-to-pointer-from-integer-of-different-size
|   |-- drivers-net-wireless-ath-ath12k-dp_tx.c:warning:cast-to-pointer-from-integer-of-different-size
|   |-- drivers-net-wireless-ath-ath12k-hal_rx.c:warning:cast-to-pointer-from-integer-of-different-size
|   `-- drivers-net-wireless-ath-ath12k-pci.c:error:implicit-declaration-of-function-of_property_read_u32
|-- arm-allmodconfig
|   |-- drivers-net-wireless-ath-ath12k-dp_mon.c:warning:implicit-conversion-from-enum-hal_rx_mon_status-to-enum-hal_tx_tlv_status
|   |-- drivers-net-wireless-ath-ath12k-dp_rx.c:warning:cast-to-pointer-from-integer-of-different-size
|   |-- drivers-net-wireless-ath-ath12k-dp_tx.c:warning:cast-to-pointer-from-integer-of-different-size
|   |-- drivers-net-wireless-ath-ath12k-hal_rx.c:warning:cast-to-pointer-from-integer-of-different-size
|   `-- drivers-net-wireless-ath-ath12k-pci.c:error:implicit-declaration-of-function-of_property_read_u32
|-- arm-allyesconfig
|   |-- drivers-net-wireless-ath-ath12k-dp_mon.c:warning:implicit-conversion-from-enum-hal_rx_mon_status-to-enum-hal_tx_tlv_status
|   |-- drivers-net-wireless-ath-ath12k-dp_rx.c:warning:cast-to-pointer-from-integer-of-different-size
|   |-- drivers-net-wireless-ath-ath12k-dp_tx.c:warning:cast-to-pointer-from-integer-of-different-size
|   |-- drivers-net-wireless-ath-ath12k-hal_rx.c:warning:cast-to-pointer-from-integer-of-different-size
|   `-- drivers-net-wireless-ath-ath12k-pci.c:error:implicit-declaration-of-function-of_property_read_u32
|-- arm64-allyesconfig
|   |-- drivers-net-wireless-ath-ath12k-dp_mon.c:warning:implicit-conversion-from-enum-hal_rx_mon_status-to-enum-hal_tx_tlv_status
|   `-- drivers-net-wireless-ath-ath12k-pci.c:error:implicit-declaration-of-function-of_property_read_u32
|-- i386-allyesconfig
|   |-- drivers-net-wireless-ath-ath12k-dp_rx.c:warning:cast-to-pointer-from-integer-of-different-size
|   |-- drivers-net-wireless-ath-ath12k-dp_tx.c:warning:cast-to-pointer-from-integer-of-different-size
|   `-- drivers-net-wireless-ath-ath12k-hal_rx.c:warning:cast-to-pointer-from-integer-of-different-size
|-- ia64-allmodconfig
|   |-- drivers-net-wireless-ath-ath12k-dp_mon.c:warning:implicit-conversion-from-enum-hal_rx_mon_status-to-enum-hal_tx_tlv_status
|   `-- drivers-net-wireless-ath-ath12k-pci.c:error:implicit-declaration-of-function-of_property_read_u32
|-- ia64-allyesconfig
|   |-- drivers-net-wireless-ath-ath12k-dp_mon.c:warning:implicit-conversion-from-enum-hal_rx_mon_status-to-enum-hal_tx_tlv_status
|   `-- drivers-net-wireless-ath-ath12k-pci.c:error:implicit-declaration-of-function-of_property_read_u32
|-- microblaze-allyesconfig
|   |-- drivers-net-wireless-ath-ath12k-dp_mon.c:warning:implicit-conversion-from-enum-hal_rx_mon_status-to-enum-hal_tx_tlv_status
|   |-- drivers-net-wireless-ath-ath12k-dp_rx.c:warning:cast-to-pointer-from-integer-of-different-size
|   |-- drivers-net-wireless-ath-ath12k-dp_tx.c:warning:cast-to-pointer-from-integer-of-different-size
|   |-- drivers-net-wireless-ath-ath12k-hal_rx.c:warning:cast-to-pointer-from-integer-of-different-size
|   `-- drivers-net-wireless-ath-ath12k-pci.c:error:implicit-declaration-of-function-of_property_read_u32
|-- mips-allmodconfig
|   |-- drivers-net-wireless-ath-ath12k-debugfs.c:warning:assignment-to-void-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-net-wireless-ath-ath12k-dp_mon.c:warning:implicit-conversion-from-enum-hal_rx_mon_status-to-enum-hal_tx_tlv_status
|   |-- drivers-net-wireless-ath-ath12k-dp_rx.c:warning:cast-to-pointer-from-integer-of-different-size
|   |-- drivers-net-wireless-ath-ath12k-dp_tx.c:warning:cast-to-pointer-from-integer-of-different-size
|   `-- drivers-net-wireless-ath-ath12k-hal_rx.c:warning:cast-to-pointer-from-integer-of-different-size
|-- mips-allyesconfig
|   |-- drivers-net-wireless-ath-ath12k-debugfs.c:warning:assignment-to-void-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-net-wireless-ath-ath12k-dp_mon.c:warning:implicit-conversion-from-enum-hal_rx_mon_status-to-enum-hal_tx_tlv_status
|   |-- drivers-net-wireless-ath-ath12k-dp_rx.c:warning:cast-to-pointer-from-integer-of-different-size
|   |-- drivers-net-wireless-ath-ath12k-dp_tx.c:warning:cast-to-pointer-from-integer-of-different-size
|   `-- drivers-net-wireless-ath-ath12k-hal_rx.c:warning:cast-to-pointer-from-integer-of-different-size
|-- parisc-allyesconfig
|   |-- drivers-net-wireless-ath-ath12k-debugfs.c:warning:assignment-to-void-from-int-makes-pointer-from-integer-without-a-cast
|   |-- drivers-net-wireless-ath-ath12k-dp_mon.c:warning:implicit-conversion-from-enum-hal_rx_mon_status-to-enum-hal_tx_tlv_status
|   |-- drivers-net-wireless-ath-ath12k-dp_rx.c:warning:cast-to-pointer-from-integer-of-different-size
|   |-- drivers-net-wireless-ath-ath12k-dp_tx.c:warning:cast-to-pointer-from-integer-of-different-size
|   |-- drivers-net-wireless-ath-ath12k-hal_rx.c:warning:cast-to-pointer-from-integer-of-different-size
|   `-- drivers-net-wireless-ath-ath12k-pci.c:error:implicit-declaration-of-function-of_property_read_u32
|-- powerpc-allmodconfig
|   |-- drivers-net-wireless-ath-ath12k-dp_mon.c:warning:implicit-conversion-from-enum-hal_rx_mon_status-to-enum-hal_tx_tlv_status
|   |-- drivers-net-wireless-ath-ath12k-dp_rx.c:warning:cast-to-pointer-from-integer-of-different-size
|   |-- drivers-net-wireless-ath-ath12k-dp_tx.c:warning:cast-to-pointer-from-integer-of-different-size
|   `-- drivers-net-wireless-ath-ath12k-hal_rx.c:warning:cast-to-pointer-from-integer-of-different-size
|-- powerpc-allyesconfig
|   |-- drivers-net-wireless-ath-ath12k-dp_mon.c:warning:implicit-conversion-from-enum-hal_rx_mon_status-to-enum-hal_tx_tlv_status
|   |-- drivers-net-wireless-ath-ath12k-dp_rx.c:warning:cast-to-pointer-from-integer-of-different-size
|   |-- drivers-net-wireless-ath-ath12k-dp_tx.c:warning:cast-to-pointer-from-integer-of-different-size
|   `-- drivers-net-wireless-ath-ath12k-hal_rx.c:warning:cast-to-pointer-from-integer-of-different-size
|-- riscv-allmodconfig
|   |-- drivers-net-wireless-ath-ath12k-dp_mon.c:warning:implicit-conversion-from-enum-hal_rx_mon_status-to-enum-hal_tx_tlv_status
|   `-- drivers-net-wireless-ath-ath12k-pci.c:error:implicit-declaration-of-function-of_property_read_u32
|-- riscv-allyesconfig
|   |-- drivers-net-wireless-ath-ath12k-dp_mon.c:warning:implicit-conversion-from-enum-hal_rx_mon_status-to-enum-hal_tx_tlv_status
|   `-- drivers-net-wireless-ath-ath12k-pci.c:error:implicit-declaration-of-function-of_property_read_u32
|-- sparc-allyesconfig
|   |-- drivers-net-wireless-ath-ath12k-debugfs.c:warning:assignment-to-void-from-int-makes-pointer-from-integer-without-a-cast
|   `-- drivers-net-wireless-ath-ath12k-dp_mon.c:warning:implicit-conversion-from-enum-hal_rx_mon_status-to-enum-hal_tx_tlv_status
`-- xtensa-allyesconfig
    |-- drivers-net-wireless-ath-ath12k-dp_mon.c:warning:implicit-conversion-from-enum-hal_rx_mon_status-to-enum-hal_tx_tlv_status
    |-- drivers-net-wireless-ath-ath12k-dp_rx.c:warning:cast-to-pointer-from-integer-of-different-size
    |-- drivers-net-wireless-ath-ath12k-dp_tx.c:warning:cast-to-pointer-from-integer-of-different-size
    |-- drivers-net-wireless-ath-ath12k-hal_rx.c:warning:cast-to-pointer-from-integer-of-different-size
    `-- drivers-net-wireless-ath-ath12k-pci.c:error:implicit-declaration-of-function-of_property_read_u32

clang_recent_errors
`-- i386-allmodconfig
    |-- drivers-net-wireless-ath-ath12k-dp_tx.c:warning:shift-count-is-negative
    `-- drivers-net-wireless-ath-ath12k-dp_tx.c:warning:shift-count-width-of-type

elapsed time: 733m

configs tested: 170
configs skipped: 4

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                 randconfig-c001-20220131
powerpc              randconfig-c003-20220131
arm                            zeus_defconfig
sh                          rsk7269_defconfig
sh                   sh7770_generic_defconfig
powerpc                 mpc85xx_cds_defconfig
powerpc                 mpc837x_rdb_defconfig
arc                              alldefconfig
powerpc                         ps3_defconfig
arm                          gemini_defconfig
sh                   sh7724_generic_defconfig
arc                         haps_hs_defconfig
mips                           ci20_defconfig
sh                             espt_defconfig
powerpc                    amigaone_defconfig
powerpc                      ppc6xx_defconfig
arc                     nsimosci_hs_defconfig
arm                        trizeps4_defconfig
arm                        mvebu_v7_defconfig
mips                         rt305x_defconfig
powerpc                    adder875_defconfig
arm                      integrator_defconfig
sh                        apsh4ad0a_defconfig
sh                        dreamcast_defconfig
arm                      jornada720_defconfig
m68k                        mvme147_defconfig
sh                           se7343_defconfig
mips                           ip32_defconfig
sh                            migor_defconfig
arm                        multi_v7_defconfig
powerpc                      tqm8xx_defconfig
arm                     eseries_pxa_defconfig
powerpc                mpc7448_hpc2_defconfig
ia64                      gensparse_defconfig
riscv                    nommu_k210_defconfig
arm                           corgi_defconfig
arm                         s3c6400_defconfig
sparc64                             defconfig
mips                         db1xxx_defconfig
mips                         mpc30x_defconfig
m68k                           sun3_defconfig
powerpc                  iss476-smp_defconfig
m68k                             allmodconfig
sh                          rsk7203_defconfig
sh                        edosk7760_defconfig
sh                           se7721_defconfig
powerpc                     stx_gp3_defconfig
sh                         ecovec24_defconfig
powerpc                      pasemi_defconfig
powerpc                     taishan_defconfig
xtensa                              defconfig
nios2                               defconfig
h8300                     edosk2674_defconfig
arm                         axm55xx_defconfig
s390                       zfcpdump_defconfig
m68k                       m5475evb_defconfig
sh                          sdk7786_defconfig
arm                        oxnas_v6_defconfig
arm                  randconfig-c002-20220130
arm                  randconfig-c002-20220131
arm                  randconfig-c002-20220202
arm                  randconfig-c002-20220201
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                             allmodconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
x86_64               randconfig-a004-20220131
x86_64               randconfig-a003-20220131
x86_64               randconfig-a001-20220131
x86_64               randconfig-a006-20220131
x86_64               randconfig-a005-20220131
x86_64               randconfig-a002-20220131
i386                 randconfig-a006-20220131
i386                 randconfig-a005-20220131
i386                 randconfig-a003-20220131
i386                 randconfig-a002-20220131
i386                 randconfig-a001-20220131
i386                 randconfig-a004-20220131
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
riscv                randconfig-r042-20220130
arc                  randconfig-r043-20220130
s390                 randconfig-r044-20220130
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                    rhel-8.3-kselftests
um                           x86_64_defconfig
um                             i386_defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                                  kexec

clang tested configs:
riscv                randconfig-c006-20220201
x86_64                        randconfig-c007
powerpc              randconfig-c003-20220201
mips                 randconfig-c004-20220201
i386                          randconfig-c001
arm                  randconfig-c002-20220201
riscv                randconfig-c006-20220130
arm                  randconfig-c002-20220130
powerpc              randconfig-c003-20220130
mips                 randconfig-c004-20220130
arm                          collie_defconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                 mpc8313_rdb_defconfig
mips                      maltaaprp_defconfig
powerpc                     mpc512x_defconfig
mips                        bcm63xx_defconfig
powerpc                     mpc5200_defconfig
arm                       cns3420vb_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64               randconfig-a013-20220131
x86_64               randconfig-a015-20220131
x86_64               randconfig-a014-20220131
x86_64               randconfig-a016-20220131
x86_64               randconfig-a011-20220131
x86_64               randconfig-a012-20220131
i386                 randconfig-a011-20220131
i386                 randconfig-a013-20220131
i386                 randconfig-a014-20220131
i386                 randconfig-a012-20220131
i386                 randconfig-a015-20220131
i386                 randconfig-a016-20220131
riscv                randconfig-r042-20220131
hexagon              randconfig-r045-20220130
hexagon              randconfig-r045-20220131
hexagon              randconfig-r041-20220130
hexagon              randconfig-r041-20220131

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
