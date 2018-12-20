Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ga1i1-00018I-ES
 for ath10k@lists.infradead.org; Thu, 20 Dec 2018 17:02:06 +0000
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: Disable 4addr source port learning in 10.4 FW
 by default
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20181112064008.3610-1-murugana@codeaurora.org>
References: <20181112064008.3610-1-murugana@codeaurora.org>
Message-Id: <20181220170155.0F5806053B@smtp.codeaurora.org>
Date: Thu, 20 Dec 2018 17:01:55 +0000 (UTC)
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
To: Sathishkumar Muruganandam <murugana@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Sathishkumar Muruganandam <murugana@codeaurora.org> wrote:

> Currently in 10.4 FW, all the received 4addr frames are processed for
> source port learning which is enabled by default. This learning can't be
> disabled by default in FW since it breaks backward compatibility.
> 
> Since ath10k uses mac80211 based 4addr mode, source port learning done in
> 10.4 FW is redundant and also causes issues when 3addr frames are
> transmitted/received for a 4addr station.
> 
> One such visible functional impact is when GTK rekey frame from
> hostapd based AP to 4addr STA is dropped in AP's 10.4 FW. This is since
> GTK rekey EAPOL frame is 3addr frame on AP interface and STA enabled
> with 4addr is already allowed for receiving 3addr EAPOL frames.
> 
> Source port learning implementation in 10.4 FW drops this 3addr GTK rekey
> frame in AP destinated for 4addr STA causing disassociation and
> re-association for every GTK rekey session. GTK rekey issue is not seen
> when learning is disabled in FW.
> 
> To prevent such issues without breaking backward compatibility, FW
> advertises new service bit making the source port learning configurable and
> this learning is being currently disabled during ath10k vdev creation.
> 
> * Tested HW: QCA9984
> * Tested FW: 10.4-3.6.0.1-00004
> 
> Signed-off-by: Sathishkumar Muruganandam <murugana@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

68c295f21abc ath10k: disable 4addr source port learning in 10.4 FW by default

-- 
https://patchwork.kernel.org/patch/10678191/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
