Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail27.static.mailgun.info ([104.130.122.27])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jE7U0-0008Oz-HS
 for ath10k@lists.infradead.org; Tue, 17 Mar 2020 08:21:56 +0000
MIME-Version: 1.0
Subject: Re: ath10k: Fill GCMP MIC length for PMF
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1584426499-27819-1-git-send-email-ssreeela@codeaurora.org>
References: <1584426499-27819-1-git-send-email-ssreeela@codeaurora.org>
Message-Id: <20200317082136.9817CC432C2@smtp.codeaurora.org>
Date: Tue, 17 Mar 2020 08:21:36 +0000 (UTC)
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
To: Sowmiya Sree Elavalagan <ssreeela@codeaurora.org>
Cc: Yingying Tang <yintang@codeaurora.org>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sowmiya Sree Elavalagan <ssreeela@codeaurora.org> wrote:

> From: Yingying Tang <yintang@codeaurora.org>
> 
> GCMP MIC length is not filled for GCMP/GCMP-256 cipher suites in
> PMF enabled case. Due to mismatch in MIC length, deauth/disassoc frames
> are unencrypted.
> This patch fills proper MIC length for GCMP/GCMP-256 cipher suites.
> 
> Tested HW: QCA9984, QCA9888
> Tested FW: 10.4-3.6-00104
> 
> Signed-off-by: Yingying Tang <yintang@codeaurora.org>
> Signed-off-by: Sowmiya Sree Elavalagan <ssreeela@codeaurora.org>

Failed to build:

drivers/net/wireless/ath/ath10k/mac.c: In function 'ath10k_mac_tx_h_fill_cb':
drivers/net/wireless/ath/ath10k/mac.c:3611:6: error: 'sta' undeclared (first use in this function); did you mean 'stat'?
  if (sta) {
      ^~~
      stat
drivers/net/wireless/ath/ath10k/mac.c:3611:6: note: each undeclared identifier is reported only once for each function it appears in
drivers/net/wireless/ath/ath10k/mac.c:3612:3: error: 'arsta' undeclared (first use in this function)
   arsta = (struct ath10k_sta *)sta->drv_priv;
   ^~~~~
make[5]: *** [drivers/net/wireless/ath/ath10k/mac.o] Error 1
make[5]: *** Waiting for unfinished jobs....
make[4]: *** [drivers/net/wireless/ath/ath10k] Error 2
make[3]: *** [drivers/net/wireless/ath] Error 2
make[2]: *** [drivers/net/wireless] Error 2
make[1]: *** [drivers/net] Error 2
make: *** [drivers] Error 2

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/patch/11441863/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
