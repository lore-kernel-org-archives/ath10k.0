Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9795C38A02
	for <ath10k@archiver.kernel.org>; Sat, 29 Oct 2022 18:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WCt5W5KC6RTCDaoNXnwLCDuXCB54x0t8DkGmmkQpNqs=; b=dcgfeWHId6zfEY
	pEOZ7voAAB4PLq1AUyeRi2iYOp6tbLfD0gjKxfaoz23nqzPKn19nrIcEYZ3CfSpyhEhDom70Bz+uO
	OID1xXeoTYmjVS60lOzkxETJsdQ8tYr5KXMIt9RMYdmVEBOyrd1me5LkOMUk1cClU+d2YA9Dhf2p8
	Iv34NVZrD+Qr8n/CPN9ZwqU+xErKWDzROlIC8YisKrvXxOVj7qfpbJPuuubTmF+IVcbbOCq2oMHsi
	5n9bXTAnY5T0jl0chQcub2zeEk9oLuMNjBsWUlcb8v1LuRF/uAYYygjkhkPJJnNmf2JTebL/Lxh5t
	Tj5vyUJNRMjl9NTtQwfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooqEj-007umb-8J; Sat, 29 Oct 2022 18:07:13 +0000
Received: from mga03.intel.com ([134.134.136.65])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooqEg-007ujf-9m
	for ath10k@lists.infradead.org; Sat, 29 Oct 2022 18:07:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667066830; x=1698602830;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SfV4k67NaAJVMQdAqWgXtaVseiFAdjVCrs46yM98Tbs=;
  b=ZYufyGEWrvDtGSorIh2HYL1saoWJlaF9gVXyBkDx2XdJYZtj09czaksI
   xbvSM1bgEYWrpEgTLzq9RfQlu+P2BzsM1c+iJCEYFJUm0VZY+ory/dQMu
   XxF+asM3eiN4MEr1e+HGjbk2FpE9uzX53RrTTMsdCu1QOKtDnYs26+26I
   dkz9S2MY0mXSmnEtiSTaiCQi119QAgNdNEfW7ZT1kw7FS5omMCzRD2nCd
   LU0+bx9hBbNUp8ceMc7vBXNMZXBftsomvvRx4DfI2NY1VjM4SJLDRfm2z
   SxR9LarGzmZEvJYw03Vett3V3OfA9NWZqD0Ejp8LQZwh7sAbtvoMLjbSz
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10515"; a="310378801"
X-IronPort-AV: E=Sophos;i="5.95,224,1661842800"; 
   d="scan'208";a="310378801"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2022 11:06:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10515"; a="611075043"
X-IronPort-AV: E=Sophos;i="5.95,224,1661842800"; 
   d="scan'208";a="611075043"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 29 Oct 2022 11:06:54 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ooqEQ-000BH7-0S;
	Sat, 29 Oct 2022 18:06:54 +0000
Date: Sun, 30 Oct 2022 02:06:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 859ad8a02d5c00dac164b5d78d8ad00cdece1c8a
Message-ID: <635d6ba9.U8S9PSO50FHNrYlV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221029_110710_413147_4B6C5446 
X-CRM114-Status: UNSURE (   4.24  )
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

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-qca
branch HEAD: 859ad8a02d5c00dac164b5d78d8ad00cdece1c8a  Merge branch 'ath-next' into ath-qca

elapsed time: 734m

configs tested: 58
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
arc                                 defconfig
s390                             allmodconfig
x86_64                          rhel-8.3-func
x86_64                           rhel-8.3-syz
x86_64                              defconfig
x86_64                    rhel-8.3-kselftests
alpha                               defconfig
s390                             allyesconfig
arm                                 defconfig
s390                                defconfig
ia64                             allmodconfig
x86_64                         rhel-8.3-kunit
x86_64                               rhel-8.3
x86_64                           rhel-8.3-kvm
x86_64                        randconfig-a013
x86_64                        randconfig-a011
x86_64                        randconfig-a015
x86_64                           allyesconfig
x86_64                        randconfig-a002
i386                                defconfig
powerpc                           allnoconfig
powerpc                          allmodconfig
mips                             allyesconfig
x86_64                        randconfig-a004
sh                               allmodconfig
arm                              allyesconfig
i386                          randconfig-a001
arc                  randconfig-r043-20221028
x86_64                        randconfig-a006
i386                          randconfig-a012
arm64                            allyesconfig
i386                          randconfig-a003
i386                          randconfig-a005
riscv                randconfig-r042-20221028
s390                 randconfig-r044-20221028
i386                          randconfig-a014
i386                          randconfig-a016
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allmodconfig
i386                             allyesconfig
m68k                             allyesconfig

clang tested configs:
x86_64                        randconfig-a014
x86_64                        randconfig-a016
x86_64                        randconfig-a012
x86_64                        randconfig-a001
x86_64                        randconfig-a003
x86_64                        randconfig-a005
i386                          randconfig-a013
hexagon              randconfig-r041-20221028
i386                          randconfig-a011
hexagon              randconfig-r045-20221028
i386                          randconfig-a002
i386                          randconfig-a004
i386                          randconfig-a006
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
