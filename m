Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B749ECAAA1
	for <ath10k@archiver.kernel.org>; Sat,  3 Sep 2022 02:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OooIdztdxiAfDrPqUCxdf9GPq7mT4bVyNnAWesFL7Fk=; b=Gyl5Bm+OFpEVgr
	pgbXj/SoU6v4rKhSB799gtyDkCtPYzbVKDAjVW6cW/zTY/MxQMrNKcxC2oPMPMdX3YhXJ1fsfxkkK
	+wGpDUUi+QuufFJw0r3pdnNrjPtymTL7Yk/Z2xLqgktjKQVHVrLBBDMqZZ9pceSpi3eUEFmM49Kzu
	MIdCNm2A0BuAeRvFJkieQ0bQMqakgP9OVKjZbxbkMhqmjhKbaEaDvRgYK/Mvn+Vywjluw+xHEPQhQ
	D3PmV+b6Y+RZpZ1BtTUWXfruu0FZr+ez2hNT7jNp8OIp0jECnSf7nHUTi4H9Z8F5JmQOk2RtD8qID
	/xKlkdC3I/phFgz7xe2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUIXg-00Fm6y-Ak; Sat, 03 Sep 2022 02:05:52 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oUIXd-00Fm1z-98
	for ath10k@lists.infradead.org; Sat, 03 Sep 2022 02:05:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1662170749; x=1693706749;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+pfW65W7cQKKmi61qG6685mvev8uS2G4lvR/BFdIjz8=;
  b=dAZwcVn6djUmakhVL4eK/SyMNuhwi7TNh+cjfZ+4ilcmwGc2ojzU0QwH
   0gOQlOcItHudjva1DUOHQu/2KsNWB0+dVxTUzhztRsrQpsrfGgWDxKYfj
   hPdkU+Yz96y/5QvjNlEZfQ4FXkjSfHtW/YbVcbALS6iGGRbmLhx6djd/1
   IU3ooXJnFMeXZOq6HnOl2Lly1bwjuLD1ZhyQ6L7wj2sSqubyXxcVpw28r
   1IHW0G5TNa8C0UI5bZbE9bqVmlyWHDA2ykY3SpHe9wKoQ46LkfNZU+Lob
   5LDWh+vifYjahfTjNa4UTkwJJ0xViOrLLSa57PflgYwI7NDNnsucUjJHP
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="276520258"
X-IronPort-AV: E=Sophos;i="5.93,286,1654585200"; 
   d="scan'208";a="276520258"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2022 19:05:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,286,1654585200"; 
   d="scan'208";a="681473243"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 02 Sep 2022 19:05:38 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oUIXR-0000t4-2T;
	Sat, 03 Sep 2022 02:05:37 +0000
Date: Sat, 03 Sep 2022 10:05:14 +0800
From: kernel test robot <lkp@intel.com>
To: Kalle Valo <quic_kvalo@quicinc.com>
Cc: ath10k@lists.infradead.org
Subject: [kvalo-ath:ath-qca] BUILD SUCCESS
 ba69daa84cef73353a3e9b55e759f2cac45fcd01
Message-ID: <6312b65a.t6rwTknfYDzLQf3z%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_190549_404445_4F509606 
X-CRM114-Status: UNSURE (   5.64  )
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
branch HEAD: ba69daa84cef73353a3e9b55e759f2cac45fcd01  Merge branch 'ath-next' into ath-qca

elapsed time: 792m

configs tested: 24
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                          allmodconfig
mips                             allyesconfig
powerpc                           allnoconfig
sh                               allmodconfig
i386                                defconfig
arm                                 defconfig
x86_64                              defconfig
x86_64                           allyesconfig
x86_64                               rhel-8.3
arm                              allyesconfig
alpha                            allyesconfig
x86_64                          rhel-8.3-func
arm64                            allyesconfig
m68k                             allyesconfig
x86_64                         rhel-8.3-kunit
i386                             allyesconfig
x86_64                           rhel-8.3-kvm
m68k                             allmodconfig
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
arc                              allyesconfig
ia64                             allmodconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
