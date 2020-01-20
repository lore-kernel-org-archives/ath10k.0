Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail26.static.mailgun.info ([104.130.122.26])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1itNNk-000139-Fi
 for ath10k@lists.infradead.org; Mon, 20 Jan 2020 03:05:42 +0000
MIME-Version: 1.0
Date: Sun, 19 Jan 2020 19:05:36 -0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH] ath10k: add retry mechanism for ath10k_start
In-Reply-To: <CAMrEMU-57qrCP3Kh_cna-QNCBfGu6G3e0Y_0-wg6axq_EuoCcw@mail.gmail.com>
References: <20200117083605.392-1-wgong@codeaurora.org>
 <CAMrEMU-57qrCP3Kh_cna-QNCBfGu6G3e0Y_0-wg6axq_EuoCcw@mail.gmail.com>
Message-ID: <cf38fc446f5228d904bd993cac9cc332@codeaurora.org>
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
To: Justin Capella <justincapella@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k <ath10k@lists.infradead.org>

On 2020-01-19 17:17, Justin Capella wrote:
> Is the same address always used for "struct ath10k *ar = hw->priv" --
> even when driver is stopped / bus errors are encountered? If not this
> could potentially be use after free scenario?
"struct ath10k *ar = hw->priv" will changed only if rmmod 
ath10k_sdio/ath10k_pci/ath10k_ahb...
it will not changed for "ifconfig wlan0 down"
> 
> Most code tries to protect the ->state with the config mutex, might
> need to do that here too
yes, I added conf_mutex to protected the ar->state change in
v2:https://patchwork.kernel.org/patch/11340881/

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
