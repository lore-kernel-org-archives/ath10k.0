Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z4nu4-00054X-KD
 for ath10k@lists.infradead.org; Tue, 16 Jun 2015 10:15:37 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: mac: remove unreachable negative return check
References: <1434039461-24899-1-git-send-email-hofrat@osadl.org>
Date: Tue, 16 Jun 2015 13:14:46 +0300
In-Reply-To: <1434039461-24899-1-git-send-email-hofrat@osadl.org> (Nicholas Mc
 Guire's message of "Thu, 11 Jun 2015 18:17:41 +0200")
Message-ID: <87a8w07yeh.fsf@kamboji.qca.qualcomm.com>
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
To: Nicholas Mc Guire <hofrat@osadl.org>
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Nicholas Mc Guire <hofrat@osadl.org> writes:

> wait_event_timeout(), introduced in 'commit 5e3dd157d7e7 ("ath10k: mac80211
> driver for Qualcomm Atheros 802.11ac CQA98xx devices")' never returns < 0
> so the only failure condition to be checked is ==0 (timeout). Further the
> return type is long not int - an appropriately named variable is added 
> and the assignments fixed up.
>
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
