Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65BFC4332F
	for <ath10k@archiver.kernel.org>; Thu, 13 Oct 2022 19:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c5ywoNLZsRdlDgXoBg4pdkGaY7V7u6Z0YeVFZTpkQyQ=; b=Req+/9dBowoX7p
	ZqAeKXt79W9GSS/ABxwrwrhRBjQ7/hnoT3PKjYGgk3dr3iqB56MyRqOChJ+Zq62wGC8rds4SR8/QK
	hcHxx1uclRUuEyL1Z6z4uO57MmPJuyQ39CcbXzeDXUhKXTeEwj0Pq8qQWRKNsmIp2iKD1aQMfZFo6
	09tUY3uIOh6h54e2W3wkJejcfgG6rzgWS06+P8UgUIA7nOvB2mn4JCCR/wW3SX0rMLh6XUk5RbgXS
	g5FVNO6skgO/yT2u8EQ9NXJGpOKFFl9j+aoCE0+HAO0pqZxhsZe9TL1pLxPifJ9xZGNGCy7EIMdm2
	n8k8QU297hKeEC9Ht0rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj4Ep-00CsZd-JI; Thu, 13 Oct 2022 19:51:27 +0000
Received: from mga02.intel.com ([134.134.136.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oj4Em-00CsYy-BQ
	for ath10k@lists.infradead.org; Thu, 13 Oct 2022 19:51:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665690684; x=1697226684;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dxC3Vg/iWTQIEte4QfoJzBpkaxhXX6DhUEQNu8IU74E=;
  b=Ea2FelDLCeIizcpQ+hBs8VGOeaPWMZTBkDIFmZzzvTqTQwh5EdE6ukaX
   0/btLSs4aNMZlL/nNfyOeIWdQQrE3vtR7qMuOcA+ZDyGC0v/SK+2jHH4N
   NBya52rjrkM2H+xe07W2RtOglKRWiEvSIwcbvlkSNGTHS0XOGs5J9KdK/
   jkMjxUnCKsWQzTfsSNmXQQZp1l1TbFUYzM7vkQ/iRb3qCF9zSIKVb7f4m
   ryvl5mgHjFhpF/OknhEgYRIHIqKEXPPr0wrBsYuOimhuQ5uRpEFTC2g7b
   LAghSY3WBi2a8kQd286YvbfLY0Vj2mV3CbOqnN7PYBF2ijfJjQLNn/I9h
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="292536441"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="292536441"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2022 12:51:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="696027680"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; 
   d="scan'208";a="696027680"
Received: from lkp-server01.sh.intel.com (HELO 2af0a69ca4e0) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 13 Oct 2022 12:51:20 -0700
Received: from kbuild by 2af0a69ca4e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oj4Eh-0005W6-30;
	Thu, 13 Oct 2022 19:51:19 +0000
Date: Fri, 14 Oct 2022 03:50:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 8123206b42ed75051d15a5fd719709ecd9266300
Message-ID: <63486c03.wmpP2/xRxy/PYklM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_125124_514762_6B6FF400 
X-CRM114-Status: UNSURE (   6.77  )
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
branch HEAD: 8123206b42ed75051d15a5fd719709ecd9266300  Merge branch 'ath-next' into ath-qca

elapsed time: 780m

configs tested: 56
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arc                                 defconfig
alpha                               defconfig
s390                             allmodconfig
s390                                defconfig
um                           x86_64_defconfig
um                             i386_defconfig
s390                             allyesconfig
i386                                defconfig
powerpc                          allmodconfig
x86_64                              defconfig
mips                             allyesconfig
x86_64                           rhel-8.3-kvm
powerpc                           allnoconfig
sh                               allmodconfig
x86_64                           rhel-8.3-syz
arm                                 defconfig
x86_64                         rhel-8.3-kunit
i386                          randconfig-a001
x86_64                          rhel-8.3-func
i386                          randconfig-a003
x86_64                        randconfig-a002
arc                  randconfig-r043-20221012
x86_64                    rhel-8.3-kselftests
m68k                             allyesconfig
riscv                randconfig-r042-20221012
s390                 randconfig-r044-20221012
i386                             allyesconfig
i386                          randconfig-a005
x86_64                        randconfig-a006
i386                          randconfig-a014
x86_64                        randconfig-a004
i386                          randconfig-a012
arm64                            allyesconfig
i386                          randconfig-a016
arm                              allyesconfig
x86_64                               rhel-8.3
csky                              allnoconfig
arc                               allnoconfig
alpha                             allnoconfig
riscv                             allnoconfig
ia64                             allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
m68k                             allmodconfig
x86_64                           allyesconfig

clang tested configs:
hexagon              randconfig-r041-20221012
hexagon              randconfig-r045-20221012
i386                          randconfig-a013
x86_64                        randconfig-a001
i386                          randconfig-a002
x86_64                        randconfig-a003
i386                          randconfig-a004
i386                          randconfig-a011
i386                          randconfig-a006
x86_64                        randconfig-a005
i386                          randconfig-a015

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
