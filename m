Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03031C433EF
	for <ath10k@archiver.kernel.org>; Mon, 23 May 2022 08:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8VacNUuOKEUya/ZFtxIz6MKJel1J+PPrf2I3hd3v6Nk=; b=096O0cLxyRJw0g
	iwKGwr0tFgX2jtGCulFb3N5uZf0pOh9mZN13I98R4XL8rg8tmc01qnH2AjujXcl3eIwtOjge0iZay
	ypm5r5i9l9Uu/LQ+389wzWsC4Ka1ZUSfWlD65MrPj0iIi2SBEkSFQ+liwAID0HWhEwwIrql35xDaZ
	21SRDQe1XYAZBLxmn/cHCPaTVckLw1w7iZzsdRUByCdHgZ7OPDjrJCbY/rUBZD6PT0LstiSJ0jA8U
	OgPzfAcVZWoxPwqsPWQsZGiEhRRwwKK8fagM1TQXSzAaffyXKi0kW3fgS6/xX92quRl/hP+hrRUgP
	IWtr6W0I+SiF1+c30THQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt3J7-002O7c-UW; Mon, 23 May 2022 08:20:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2t7-002CKb-Ov
 for ath10k@bombadil.infradead.org; Mon, 23 May 2022 07:54:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=23HTuiuLU8WfqrgEwua3ieK5MPShiOgYJoM3rz933I0=; b=iaaTFXjX3G5jURigKLh3UIPHXg
 icQ3P5vjJTmfQHLBovMaxP6hRA0cmEuwE7TruWB3XStAnEzH58R6bGp2QOJw2K/CHHrXCrmu8fMJ7
 j9CyEHmP1Bv89dD8NYBZM4vmJruGKNZKn+0DKWh02ffb/7pNx1TmYJXyNEpI1Z4HST+De09agvlDv
 7f1uOS5p7ji+CQdKsmlaPJN5XjQUnMZnQiqRg5OfAsDmcp84UunIp0npWD2tXeAesBoNcAxk0JI/o
 6JuDpQQnIxjW0rVyPU9VOVcjP8lE+nY08ESPs7qD1aDNDljVoYBa1oHDsJvRy4KClj3xqUZjG6Ans
 pRsTiN9Q==;
Received: from mga03.intel.com ([134.134.136.65])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsxU2-000kot-6T
 for ath10k@lists.infradead.org; Mon, 23 May 2022 02:07:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653271666; x=1684807666;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=8RS1AiLFhzpXFu3KH4nQnhOgYeS0rj4Y/pOrhsQcB1A=;
 b=Af0NAZx3RfG9xu8gDXYaYlpDz/z5uw2gruFpYn17k7dQoOEf5Mn8I/5o
 sAnxvxElwwM8xTzxUt67eGCtDFjtaZQnvjOvKcXe9m3FA8YZjsboQiM+o
 yZqgPTEZkjYkXfx1TjRsBDiVaz+pzKy2pT1jhErii3tTTJQYmlKKjjqIG
 ijnUfoF+Kt+GLpTGxTeIJXOC5tKoLqGp9HfF3fe87kU+//O1rEdMybtsy
 GD18/t/9RmX/gr2q9BXxll+5+IRpSJxwGCHCN8/67AojNtq6BUgqFuRbe
 MMrG+v86Z6OBKjSHFl3aM9a0a8tztMTk33dg8o02P7LTW5SQbzcxx7YcH A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10355"; a="273066245"
X-IronPort-AV: E=Sophos;i="5.91,245,1647327600"; d="scan'208";a="273066245"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2022 19:06:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,245,1647327600"; d="scan'208";a="663190738"
Received: from lkp-server01.sh.intel.com (HELO db63a1be7222) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 22 May 2022 19:06:30 -0700
Received: from kbuild by db63a1be7222 with local (Exim 4.95)
 (envelope-from <lkp@intel.com>) id 1nsxSn-0000oQ-Uu;
 Mon, 23 May 2022 02:06:29 +0000
Date: Mon, 23 May 2022 10:06:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:pending] BUILD SUCCESS
 d37869070e54f51bf5ac9109367420042cdf75d7
Message-ID: <628aec17.DO1yRUOIVI8dZpdl%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_030746_732035_C23B895B 
X-CRM114-Status: UNSURE (   5.59  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
branch HEAD: d37869070e54f51bf5ac9109367420042cdf75d7  ath6kl: fix typo in comment

elapsed time: 723m

configs tested: 102
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm64                               defconfig
arm64                            allyesconfig
arm                              allmodconfig
arm                                 defconfig
arm                              allyesconfig
i386                          randconfig-c001
arm                            hisi_defconfig
arc                        vdk_hs38_defconfig
sh                            shmin_defconfig
parisc                              defconfig
mips                      fuloong2e_defconfig
arm                         lpc18xx_defconfig
xtensa                           allyesconfig
csky                             alldefconfig
um                             i386_defconfig
m68k                         apollo_defconfig
arm                        trizeps4_defconfig
arm                        cerfcube_defconfig
mips                         db1xxx_defconfig
arm                            xcep_defconfig
powerpc                     tqm8548_defconfig
arm                        clps711x_defconfig
arm                          pxa3xx_defconfig
mips                     decstation_defconfig
arm                           sunxi_defconfig
arm                            zeus_defconfig
arm                            qcom_defconfig
m68k                             allyesconfig
m68k                                defconfig
m68k                          hp300_defconfig
m68k                             alldefconfig
sh                           sh2007_defconfig
arm                  randconfig-c002-20220522
x86_64                        randconfig-c001
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
m68k                             allmodconfig
csky                                defconfig
nios2                            allyesconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                               defconfig
arc                              allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
s390                                defconfig
s390                             allmodconfig
parisc64                            defconfig
parisc                           allyesconfig
s390                             allyesconfig
sparc                               defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
i386                   debian-10.3-kselftests
i386                              debian-10.3
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
i386                          randconfig-a012
i386                          randconfig-a014
i386                          randconfig-a016
x86_64                        randconfig-a006
x86_64                        randconfig-a004
x86_64                        randconfig-a002
arc                  randconfig-r043-20220522
s390                 randconfig-r044-20220522
riscv                randconfig-r042-20220522
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
riscv                    nommu_k210_defconfig
riscv                             allnoconfig
riscv                            allmodconfig
riscv                            allyesconfig
um                           x86_64_defconfig
x86_64                                  kexec
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                    rhel-8.3-kselftests
x86_64                         rhel-8.3-kunit

clang tested configs:
arm                           omap1_defconfig
s390                             alldefconfig
arm                            mmp2_defconfig
powerpc                 mpc8560_ads_defconfig
arm                        magician_defconfig
mips                     cu1830-neo_defconfig
powerpc                          allyesconfig
arm                        mvebu_v5_defconfig
powerpc                     kmeter1_defconfig
i386                          randconfig-a002
i386                          randconfig-a006
i386                          randconfig-a004
x86_64                        randconfig-a012
x86_64                        randconfig-a014
x86_64                        randconfig-a016

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
