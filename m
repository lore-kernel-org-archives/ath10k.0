Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g9YR1-0007Eh-55
 for ath10k@lists.infradead.org; Mon, 08 Oct 2018 16:31:08 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath10k-firmware: QCA9984 hw1.0: Add Netgear Orbi Pro SRK60
 specific BDFs
References: <CAOX2RU5j9hsvZP4J_x3t0_L03budt_GLUN4FdtrM+7sKZ-wuXg@mail.gmail.com>
 <87woqsd24l.fsf@kamboji.qca.qualcomm.com>
 <CAOX2RU7pReo7+P-w8gtGXtrD+aNW_tb00dr8wkz9o3qPfNpooA@mail.gmail.com>
Date: Mon, 08 Oct 2018 19:30:52 +0300
In-Reply-To: <CAOX2RU7pReo7+P-w8gtGXtrD+aNW_tb00dr8wkz9o3qPfNpooA@mail.gmail.com>
 (Robert Marko's message of "Mon, 8 Oct 2018 17:47:31 +0200")
Message-ID: <877eisz9hf.fsf@codeaurora.org>
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
To: Robert Marko <robimarko@gmail.com>
Cc: ath10k@lists.infradead.org

Robert Marko <robimarko@gmail.com> writes:

> Thanks, checked with ath10k-bdencoder and its correct.

Great, thanks for checking.

> Are you planning to push this changes also to linux-firmware?
> OpenWrt has switched to using board files from linux-firmware for ath10k.

Yes, I'm sending a pull request any day now. I was trying to do it today
but found a bug in my script.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
