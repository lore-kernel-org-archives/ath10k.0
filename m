Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B51CE79D7
	for <ath10k@archiver.kernel.org>; Wed, 20 Sep 2023 14:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kc39Mgv+X1roqUdnw3xoTzZyKX2beqyK2VTDOXz3QuQ=; b=wMZahfSp8G7hyT
	uuEPacBggkGXkJkAuBIbXwEQGEPIoluV9RVeRh1/jUriSh6IU8VldjPp7oo8j2VLZ+JxIszzhq7UB
	V6qi21RGbVQUj4oN76gbmwdKhqK5ICh1mXk/1CVQH7XKZV7i5VEvvRzR6UBPVTefXgHFCNX7/5i/t
	Sb+oILnSaYyMCM73Q7D8Kdn60//y92s5JawNZo4WnlMFFTw7KnnKDHHS0wAZ4437IB3YMOYuwEWOq
	5WA08JwI2NLkq0IK6TCjG9YA1kDZe5UX7TjovnploGmQRcvI0T/yLqeC3wTU8BORolUnbMd2xMl0H
	j8IGM4BRUjD7In5GKKEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiy4W-003J0w-0Z;
	Wed, 20 Sep 2023 14:20:56 +0000
Received: from mgamail.intel.com ([192.55.52.136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiy4S-003Izw-0Q
	for ath10k@lists.infradead.org;
	Wed, 20 Sep 2023 14:20:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695219652; x=1726755652;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+yYhz+1LWcxeHLfgL0jWizkKmRw2XYNL5ixJn6K+hNA=;
  b=FraRc8YH9//HN0rq/t9AjK/m75A8aim1WgyGdZ677wEZXVf9NkFwuhuY
   6LDlVxbdnoenbEhhK0JtASchjsMPxsQd+OzUzxVDNFay9hbLpXTEfcZAu
   MkzXRaGk42ZibYCieJVW7MY7FqsK1rcZEhPFMLb1HdXUH+crrv3EVdv28
   3cAV8XJkSnlqFwyPHVSpsQGW8vE92zgPIbCIuJ8Q+VhpPWsj6pxsBAS/t
   gilRZLWw+UFa6VMRv0Ep6c9TtP3R7Eh8aescDrDLQX3RKa85ANZurCbB3
   KYivLQ5O8SBvWdOon90jfvaSYRqY3FaEPTZYqCwPcDms9JI7DZb6xFhtm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="359625706"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="359625706"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 07:20:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="889933198"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="889933198"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 20 Sep 2023 07:19:34 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiy3w-0008ok-2b;
	Wed, 20 Sep 2023 14:20:20 +0000
Date: Wed, 20 Sep 2023 22:20:00 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Antipov <dmantipov@yandex.ru>,
	Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Kalle Valo <kvalo@kernel.org>,
	ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: Re: [PATCH] wifi: ath10k: consistently use kstrtoX_from_user()
 functions
Message-ID: <202309202242.GlXozks6-lkp@intel.com>
References: <20230920115249.38296-1-dmantipov@yandex.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230920115249.38296-1-dmantipov@yandex.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_072052_327023_4B5C2664 
X-CRM114-Status: GOOD (  13.71  )
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

Hi Dmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvalo-ath/ath-next]
[also build test WARNING on wireless-next/main wireless/main linus/master v6.6-rc2 next-20230920]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dmitry-Antipov/wifi-ath10k-consistently-use-kstrtoX_from_user-functions/20230920-195625
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath-next
patch link:    https://lore.kernel.org/r/20230920115249.38296-1-dmantipov%40yandex.ru
patch subject: [PATCH] wifi: ath10k: consistently use kstrtoX_from_user() functions
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20230920/202309202242.GlXozks6-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309202242.GlXozks6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309202242.GlXozks6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/ath/ath10k/debug.c: In function 'ath10k_write_btcoex':
>> drivers/net/wireless/ath/ath10k/debug.c:1996:69: warning: format '%ld' expects argument of type 'long int', but argument 3 has type 'ssize_t' {aka 'int'} [-Wformat=]
    1996 |                         ath10k_warn(ar, "failed to enable btcoex: %ld\n", ret);
         |                                                                   ~~^     ~~~
         |                                                                     |     |
         |                                                                     |     ssize_t {aka int}
         |                                                                     long int
         |                                                                   %d


vim +1996 drivers/net/wireless/ath/ath10k/debug.c

  1961	
  1962	static ssize_t ath10k_write_btcoex(struct file *file,
  1963					   const char __user *ubuf,
  1964					   size_t count, loff_t *ppos)
  1965	{
  1966		struct ath10k *ar = file->private_data;
  1967		ssize_t ret;
  1968		bool val;
  1969		u32 pdev_param;
  1970	
  1971		ret = kstrtobool_from_user(ubuf, count, &val);
  1972		if (ret)
  1973			return ret;
  1974	
  1975		if (!ar->coex_support)
  1976			return -EOPNOTSUPP;
  1977	
  1978		mutex_lock(&ar->conf_mutex);
  1979	
  1980		if (ar->state != ATH10K_STATE_ON &&
  1981		    ar->state != ATH10K_STATE_RESTARTED) {
  1982			ret = -ENETDOWN;
  1983			goto exit;
  1984		}
  1985	
  1986		if (!(test_bit(ATH10K_FLAG_BTCOEX, &ar->dev_flags) ^ val)) {
  1987			ret = count;
  1988			goto exit;
  1989		}
  1990	
  1991		pdev_param = ar->wmi.pdev_param->enable_btcoex;
  1992		if (test_bit(ATH10K_FW_FEATURE_BTCOEX_PARAM,
  1993			     ar->running_fw->fw_file.fw_features)) {
  1994			ret = ath10k_wmi_pdev_set_param(ar, pdev_param, val);
  1995			if (ret) {
> 1996				ath10k_warn(ar, "failed to enable btcoex: %ld\n", ret);
  1997				ret = count;
  1998				goto exit;
  1999			}
  2000		} else {
  2001			ath10k_info(ar, "restarting firmware due to btcoex change");
  2002			ath10k_core_start_recovery(ar);
  2003		}
  2004	
  2005		if (val)
  2006			set_bit(ATH10K_FLAG_BTCOEX, &ar->dev_flags);
  2007		else
  2008			clear_bit(ATH10K_FLAG_BTCOEX, &ar->dev_flags);
  2009	
  2010		ret = count;
  2011	
  2012	exit:
  2013		mutex_unlock(&ar->conf_mutex);
  2014	
  2015		return ret;
  2016	}
  2017	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
