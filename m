Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOi4V-00073E-1i
 for ath10k@lists.infradead.org; Thu, 28 Jan 2016 08:36:56 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 13/13] ath10k: implement push-pull tx
References: <1453384006-31907-1-git-send-email-michal.kazior@tieto.com>
 <1453384006-31907-14-git-send-email-michal.kazior@tieto.com>
 <56A1182A.4060309@codeaurora.org>
Date: Thu, 28 Jan 2016 10:36:20 +0200
In-Reply-To: <56A1182A.4060309@codeaurora.org> (Peter Oh's message of "Thu, 21
 Jan 2016 09:40:58 -0800")
Message-ID: <8737tim77f.fsf@kamboji.qca.qualcomm.com>
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
To: Peter Oh <poh@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

Peter Oh <poh@codeaurora.org> writes:

>> +	spin_lock_bh(&ar->htt.tx_lock);
>> +	ath10k_mac_tx_lock(ar, ATH10K_TX_PAUSE_Q_FLUSH_PENDING);
>> +	spin_unlock_bh(&ar->htt.tx_lock);
>> +
>
> Isn't it proved it break Mesh from working?

Please think of others and edit your quotes, it was annoying to find
this oneliner from a 500+ line message.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
