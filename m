Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvX2O-0001Bq-9x
 for ath10k@lists.infradead.org; Wed, 15 Jul 2020 02:20:54 +0000
MIME-Version: 1.0
Date: Tue, 14 Jul 2020 19:20:22 -0700
From: Rajkumar Manoharan <rmanohar@codeaurora.org>
Subject: Re: [PATCH v5.8] ath10k: Fix NULL pointer dereference in AHB device
 probe
In-Reply-To: <20200714205802.17688-1-hauke@hauke-m.de>
References: <20200714205802.17688-1-hauke@hauke-m.de>
Message-ID: <03aa088e5d2b46f570372f72c430f93f@codeaurora.org>
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
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: mkenna@codeaurora.org, linux-wireless-owner@vger.kernel.org, Stefan Lippers-Hollmann <s.l-h@gmx.de>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, kvalo@codeaurora.org

On 2020-07-14 13:58, Hauke Mehrtens wrote:
> This fixes a NULL pointer dereference in the probe path for AHB 
> devices.
> There attr parameter in the ath10k_ce_alloc_pipe() function is not
> initialized, but accessed. This function is called by
> ath10k_pci_setup_resource() which is called by ath10k_ahb_probe().
> 
> The struct ath10k_pci is also used for AHB devices and not only for PCI
> devices.
> 
> The initialization of the new members of struct ath10k_pci is moved to
> ath10k_pci_setup_resource() which is used by the PCI and the AHB code.
> 
> This also fixes a use after free bug in ath10k_pci_remove() when ar_pci
> is accessed after ath10k_core_destroy() was called, which calls
> ieee80211_free_hw() and frees this memory.
> 
> This fixes the following bug seen with backports-5.8-rc2 on OpenWrt on 
> a
> IPQ4019 device:
> 
Thanks Hauke for taking care of this. Your change LGTM.

-Rajkumar

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
