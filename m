Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsO2l-0005Ne-RZ
 for ath10k@lists.infradead.org; Sat, 09 Feb 2019 08:31:25 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [ath6kl:pending 12/32]
 drivers/net/wireless/ath/wil6210/txrx.c:341:25: warning: 'rtap' may be used
 uninitialized in this function
References: <201902090225.xWQGRZWS%fengguang.wu@intel.com>
Date: Sat, 09 Feb 2019 10:31:18 +0200
In-Reply-To: <201902090225.xWQGRZWS%fengguang.wu@intel.com> (kbuild test
 robot's message of "Sat, 9 Feb 2019 02:26:28 +0800")
Message-ID: <87pns17489.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: kbuild test robot <lkp@intel.com>
Cc: Maya Erez <merez@codeaurora.org>, linux-wireless@vger.kernel.org, kbuild-all@01.org, ath10k@lists.infradead.org

+ linux-wireless

kbuild test robot <lkp@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git pending
> head:   6e56895b48f885973e44231cac5f3f39a7068d36
> commit: 18c7c63dcc54feb0e0438ff20b528ea3945d82e0 [12/32] wil6210: remove rtap_include_phy_info module param
> config: xtensa-allyesconfig (attached as .config)
> compiler: xtensa-linux-gcc (GCC) 8.2.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 18c7c63dcc54feb0e0438ff20b528ea3945d82e0
>         # save the attached .config to linux build tree
>         GCC_VERSION=8.2.0 make.cross ARCH=xtensa 
>
> Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
> http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings
>
> All warnings (new ones prefixed by >>):
>
>    drivers/net/wireless/ath/wil6210/txrx.c: In function 'wil_vring_reap_rx':
>>> drivers/net/wireless/ath/wil6210/txrx.c:341:25: warning: 'rtap' may be used uninitialized in this function [-Wmaybe-uninitialized]
>      rtap->rthdr.it_version = PKTHDR_RADIOTAP_VERSION;
>    drivers/net/wireless/ath/wil6210/txrx.c:331:23: note: 'rtap' was declared here
>      struct wil6210_rtap *rtap;
>                           ^~~~
>
> vim +/rtap +341 drivers/net/wireless/ath/wil6210/txrx.c
>
>    304	
>    305	/**
>    306	 * Adds radiotap header
>    307	 *
>    308	 * Any error indicated as "Bad FCS"
>    309	 *
>    310	 * Vendor data for 04:ce:14-1 (Wilocity-1) consists of:
>    311	 *  - Rx descriptor: 32 bytes
>    312	 *  - Phy info
>    313	 */
>    314	static void wil_rx_add_radiotap_header(struct wil6210_priv *wil,
>    315					       struct sk_buff *skb)
>    316	{
>    317		struct wil6210_rtap {
>    318			struct ieee80211_radiotap_header rthdr;
>    319			/* fields should be in the order of bits in rthdr.it_present */
>    320			/* flags */
>    321			u8 flags;
>    322			/* channel */
>    323			__le16 chnl_freq __aligned(2);
>    324			__le16 chnl_flags;
>    325			/* MCS */
>    326			u8 mcs_present;
>    327			u8 mcs_flags;
>    328			u8 mcs_index;
>    329		} __packed;

This is an odd place to define a structure.

>    330		struct vring_rx_desc *d = wil_skb_rxdesc(skb);
>    331		struct wil6210_rtap *rtap;
>    332		int rtap_len = sizeof(struct wil6210_rtap);
>    333		struct ieee80211_channel *ch = wil->monitor_chandef.chan;
>    334	
>    335		if (skb_headroom(skb) < rtap_len &&
>    336		    pskb_expand_head(skb, rtap_len, 0, GFP_ATOMIC)) {
>    337			wil_err(wil, "Unable to expand headroom to %d\n", rtap_len);
>    338			return;
>    339		}
>    340	
>  > 341		rtap->rthdr.it_version = PKTHDR_RADIOTAP_VERSION;

Looks like a valid warning to me.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
