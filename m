Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA4EI-0006fR-P7
 for ath10k@lists.infradead.org; Mon, 24 Aug 2020 04:37:14 +0000
MIME-Version: 1.0
Date: Mon, 24 Aug 2020 12:36:51 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v4 1/2] ath10k: add refcount for ath10k_core_restart
In-Reply-To: <725b4377f63c76627e1e68604323cb74@codeaurora.org>
References: <20200108031957.22308-1-wgong@codeaurora.org>
 <20200108031957.22308-2-wgong@codeaurora.org>
 <87imdlkuw8.fsf@codeaurora.org>
 <725b4377f63c76627e1e68604323cb74@codeaurora.org>
Message-ID: <41a24ff4694edca225e1c062184e8742@codeaurora.org>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2020-08-20 17:18, Wen Gong wrote:
...
> I thinks we can use test_and_set_bit for atomic operation athough it
> is same with restart_count.
> and add a new flag, ATH10K_FLAG_CRASH_FLUSH is used for flush,
> if still use ATH10K_FLAG_CRASH_FLUSH, it should change clear_bit of it 
> from
> ath10k_core_start to ath10k_reconfig_complete,because
> ieee80211_reconfig(called by
> ieee80211_restart_work)
> of mac80211 do many things and drv_start is 1st thing and
> drv_reconfig_complete is last thing, drv_reconfig_complete done means
> the restart
> finished.
> 
> I will send patch v5 with above changes if not other advise.
v5 sent: https://patchwork.kernel.org/patch/11728101/
...

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
