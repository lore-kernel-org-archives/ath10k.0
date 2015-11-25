Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1VL9-0007MW-Fe
 for ath10k@lists.infradead.org; Wed, 25 Nov 2015 08:22:11 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: kvalo firmware confusion
References: <87mvu3qtur.fsf@kamboji.qca.qualcomm.com>
 <783909936.9966106.1448383777336.JavaMail.yahoo@mail.yahoo.com>
Date: Wed, 25 Nov 2015 10:21:36 +0200
In-Reply-To: <783909936.9966106.1448383777336.JavaMail.yahoo@mail.yahoo.com>
 (Joerg Pommnitz's message of "Tue, 24 Nov 2015 16:49:37 +0000 (UTC)")
Message-ID: <87610qqyjz.fsf@kamboji.qca.qualcomm.com>
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
To: Joerg Pommnitz <pommnitz@yahoo.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Joerg Pommnitz <pommnitz@yahoo.com> writes:

> Thanks for the clarification.
> Somebody should update 
>
>
>
> https://wireless.wiki.kernel.org/en/users/Drivers/ath10k/firmware
>
> It states, that 10.2 is for 3.18.

I just checked, 3.18 should try firmware-3.bin first and hence it should
support 10.2. So the wiki page is correct.

Is your version of ath10k trying to download firmware-3.bin first? If
yes, you should be able to use 10.2 firmware.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
