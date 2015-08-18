Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRfTl-00029F-U9
 for ath10k@lists.infradead.org; Tue, 18 Aug 2015 11:54:58 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Unable to set channel above 100 with latest CT Kernel and Firmware
References: <1439738757-29199-1-git-send-email-me@bobcopeland.com>
 <1439738757-29199-4-git-send-email-me@bobcopeland.com>
 <55D1C02F.4010005@tu-bs.de>
Date: Tue, 18 Aug 2015 14:54:29 +0300
In-Reply-To: <55D1C02F.4010005@tu-bs.de> (Hannes Harms's message of "Mon, 17
 Aug 2015 13:06:23 +0200")
Message-ID: <874mjwdd6y.fsf@kamboji.qca.qualcomm.com>
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
To: "Harms, Hannes" <hannes.harms@tu-bs.de>
Cc: ath10k@lists.infradead.org

"Harms, Hannes" <hannes.harms@tu-bs.de> writes:

> I am trying to set up the latest Kernel (4.2rc6) and firmware
> (10.1.467-ct-14) form Candela for a 5Ghz network.
> Unfortunately I am not able to set channels above 100, although
> regulatory domain is set to DE.
> Maybe someone has an advice what is going wrong?

Btw, please don't hijack threads (ie. reply to an existing thread and
change subject) as it confuses patchwork[1]. Instead start a new thread.

[1] https://patchwork.kernel.org/patch/7023511/

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
