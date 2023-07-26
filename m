Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5320EC001DE
	for <ath10k@archiver.kernel.org>; Wed, 26 Jul 2023 10:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HXNDs6RYc6NpF76TuewFZKlE2KrX7C4pgxlO6Ux2uSs=; b=m29/aaX/j9B3hA
	XGCHYBFaSigAHJS+TU0s1GOC3Y3pNQvk1ZmNoZHwv8DWaGR65Mia7bNrBy4jnYQr7Tg3CLSS6Arty
	m7twVNLc4Y1C26pstXREr34qhYfFpWCMMOwxVMdtAZCv9czn1Z4hlvF4f5SeVzZtcf+gyf51rza4o
	I9ZdVMEBpwp42EU8rrr1nsehAiBEriGXIneAlCR/6T4GUbAOJMcshYSCYLyjCgsvkYwLngLQv41Uu
	t/VLebiWpzdfV+DxsOlMo0Imtt0fC8Ffid6FEOdu3fXfBpZ3B/eJKQk2U1nJ8CtAHKzsCpI6Pg4qC
	OOmGi62wLtGkfs1nuwhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qObpm-009uJ0-2v;
	Wed, 26 Jul 2023 10:33:34 +0000
Received: from mga17.intel.com ([192.55.52.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qObpj-009uHO-10
	for ath10k@lists.infradead.org;
	Wed, 26 Jul 2023 10:33:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690367611; x=1721903611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a9My0qhwcsm4j4v87vbgAqMQPVMGCGaUaik1wE3ozvw=;
  b=CpFeLTRpZPymMBZt1H5ldLeqq3CipCemx5yi0Mhb0qJY+p8ejtaJSlUg
   w5EPZ0payu6lX7f2scj5K+xBgkK6GuO1zHJX3AvMSO/QXikpzOBRNLhTH
   r1AYGexayB65HZ1f2CM70336W6svnlf2kbKYQ33hkZtYq9+3Ey8DEYFYu
   eFLE6U68xZGiJRZTNHXiHvv+e8GoW4IFYVTrHgJHpgJaHtHcAoqPfL5gX
   lRzV/4F1kCUGCUIjbOAqbxnffNjkwwTKpbYJOWulQwErnXHtJcGIJz6Em
   s0sCdGy5tdehXZOnl9+vGG64ZrMJyGuL69qWRQyUXNiVmyvfCxpJ//oAI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="348255769"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="348255769"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 03:33:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="900367130"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="900367130"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 26 Jul 2023 03:33:04 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qObpH-0000tb-1P;
	Wed, 26 Jul 2023 10:33:03 +0000
Date: Wed, 26 Jul 2023 18:32:17 +0800
From: kernel test robot <lkp@intel.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Kalle Valo <kvalo@codeaurora.org>,
	ath10k@lists.infradead.org, Kalle Valo <quic_kvalo@quicinc.com>
Subject: [kvalo-ath:ath11k-hibernation-support 4/9]
 drivers/accel/qaic/mhi_controller.c:545:9: error: too few arguments to
 function 'mhi_power_down'
Message-ID: <202307261804.lOEj99hg-lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_033331_390988_DCDBD33E 
X-CRM114-Status: UNSURE (   8.83  )
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath11k-hibernation-support
head:   2f0b0c54cf91e991ecddcdce331a741f7c55559f
commit: e1e2b7c6fc02d9f89f94d99e61516b1eb4cd4053 [4/9] bus: mhi: host: add destroy_device argument to mhi_power_down()
config: openrisc-randconfig-r001-20230726 (https://download.01.org/0day-ci/archive/20230726/202307261804.lOEj99hg-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307261804.lOEj99hg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307261804.lOEj99hg-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/accel/qaic/mhi_controller.c: In function 'qaic_mhi_free_controller':
>> drivers/accel/qaic/mhi_controller.c:545:9: error: too few arguments to function 'mhi_power_down'
     545 |         mhi_power_down(mhi_cntrl, link_up);
         |         ^~~~~~~~~~~~~~
   In file included from drivers/accel/qaic/mhi_controller.c:9:
   include/linux/mhi.h:647:6: note: declared here
     647 | void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful,
         |      ^~~~~~~~~~~~~~
   drivers/accel/qaic/mhi_controller.c: In function 'qaic_mhi_start_reset':
   drivers/accel/qaic/mhi_controller.c:552:9: error: too few arguments to function 'mhi_power_down'
     552 |         mhi_power_down(mhi_cntrl, true);
         |         ^~~~~~~~~~~~~~
   include/linux/mhi.h:647:6: note: declared here
     647 | void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful,
         |      ^~~~~~~~~~~~~~


vim +/mhi_power_down +545 drivers/accel/qaic/mhi_controller.c

a36bf7af868b4b8 Jeffrey Hugo 2023-03-27  542  
a36bf7af868b4b8 Jeffrey Hugo 2023-03-27  543  void qaic_mhi_free_controller(struct mhi_controller *mhi_cntrl, bool link_up)
a36bf7af868b4b8 Jeffrey Hugo 2023-03-27  544  {
a36bf7af868b4b8 Jeffrey Hugo 2023-03-27 @545  	mhi_power_down(mhi_cntrl, link_up);
a36bf7af868b4b8 Jeffrey Hugo 2023-03-27  546  	mhi_unprepare_after_power_down(mhi_cntrl);
a36bf7af868b4b8 Jeffrey Hugo 2023-03-27  547  	mhi_unregister_controller(mhi_cntrl);
a36bf7af868b4b8 Jeffrey Hugo 2023-03-27  548  }
a36bf7af868b4b8 Jeffrey Hugo 2023-03-27  549  

:::::: The code at line 545 was first introduced by commit
:::::: a36bf7af868b4b84f026a752671df66f0809bd3d accel/qaic: Add MHI controller

:::::: TO: Jeffrey Hugo <quic_jhugo@quicinc.com>
:::::: CC: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
