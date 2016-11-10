Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c4iqO-0006fw-53
 for ath10k@lists.infradead.org; Thu, 10 Nov 2016 06:28:17 +0000
MIME-Version: 1.0
Date: Thu, 10 Nov 2016 11:57:54 +0530
From: Tamizh chelvam <tamizhchelvam@codeaurora.org>
Subject: Re: [PATCH 2/4] ath10k: Add support to update btcoex priority value
 via nl80211
In-Reply-To: <alpine.DEB.2.20.1611092149120.2206@hadrien>
References: <201611090629.9JO64IrN%fengguang.wu@intel.com>
 <alpine.DEB.2.20.1611092149120.2206@hadrien>
Message-ID: <5099054e6f8d4ea605d4af2f303ed31d@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: c_traja@qti.qualcomm.com, linux-wireless@vger.kernel.org, kbuild-all@01.org, ath10k@lists.infradead.org

On 2016-11-10 02:20, Julia Lawall wrote:
> It seems possible that one might like to release the mutex lock before 
> the
> return on line 7556.
> 
yes mutex lock needs to release. I will send a v2 patch with the change.

> julia
> 
> 
> 
> On Wed, 9 Nov 2016, kbuild test robot wrote:
> 
>> Hi Tamizh,
>> 
>> [auto build test WARNING on ath6kl/ath-next]
>> [cannot apply to v4.9-rc4 next-20161108]
>> [if your patch is applied to the wrong git tree, please drop us a note 
>> to help improve the system]
>> 
>> url:    
>> https://github.com/0day-ci/linux/commits/c_traja-qti-qualcomm-com/ath10k-Add-support-for-BTCOEX-feature/20161109-043718
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git 
>> ath-next
>> :::::: branch date: 2 hours ago
>> :::::: commit date: 2 hours ago
>> 
>> >> drivers/net/wireless/ath/ath10k/mac.c:7556:2-8: preceding lock on line 7545
>> 
>> git remote add linux-review https://github.com/0day-ci/linux
>> git remote update linux-review
>> git checkout 2fc922b27f111b9e8089a3e94a17ee827e769c55
>> vim +7556 drivers/net/wireless/ath/ath10k/mac.c
>> 
>> 2fc922b2 Tamizh chelvam 2016-11-08  7539
>> 2fc922b2 Tamizh chelvam 2016-11-08  7540  	if 
>> (!(test_bit(ATH10K_FLAG_BTCOEX, &ar->dev_flags))) {
>> 2fc922b2 Tamizh chelvam 2016-11-08  7541  		ret = -EINVAL;
>> 2fc922b2 Tamizh chelvam 2016-11-08  7542  		goto exit;
>> 2fc922b2 Tamizh chelvam 2016-11-08  7543  	}
>> 2fc922b2 Tamizh chelvam 2016-11-08  7544
>> 2fc922b2 Tamizh chelvam 2016-11-08 @7545  
>> 	mutex_lock(&ar->conf_mutex);
>> 2fc922b2 Tamizh chelvam 2016-11-08  7546
>> 2fc922b2 Tamizh chelvam 2016-11-08  7547  	if (ar->state != 
>> ATH10K_STATE_ON &&
>> 2fc922b2 Tamizh chelvam 2016-11-08  7548  	    ar->state != 
>> ATH10K_STATE_RESTARTED) {
>> 2fc922b2 Tamizh chelvam 2016-11-08  7549  		ret = -ENETDOWN;
>> 2fc922b2 Tamizh chelvam 2016-11-08  7550  		goto exit;
>> 2fc922b2 Tamizh chelvam 2016-11-08  7551  	}
>> 2fc922b2 Tamizh chelvam 2016-11-08  7552
>> 2fc922b2 Tamizh chelvam 2016-11-08  7553  	btcoex_prio = 
>> ath10k_mac_get_btcoex_prio(btcoex_priority);
>> 2fc922b2 Tamizh chelvam 2016-11-08  7554
>> 2fc922b2 Tamizh chelvam 2016-11-08  7555  	if (btcoex_prio > 0x3f)
>> 2fc922b2 Tamizh chelvam 2016-11-08 @7556  		return -E2BIG;
>> 2fc922b2 Tamizh chelvam 2016-11-08  7557
>> 2fc922b2 Tamizh chelvam 2016-11-08  7558  	ret = 
>> ath10k_wmi_set_coex_param(ar, btcoex_prio);
>> 2fc922b2 Tamizh chelvam 2016-11-08  7559
>> 
>> ---
>> 0-DAY kernel test infrastructure                Open Source Technology 
>> Center
>> https://lists.01.org/pipermail/kbuild-all                   Intel 
>> Corporation
>> 

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
