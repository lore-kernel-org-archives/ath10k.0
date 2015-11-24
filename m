Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1FsR-0006VH-6K
 for ath10k@lists.infradead.org; Tue, 24 Nov 2015 15:51:32 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: kvalo firmware confusion
References: <35593366.8510667.1448375044619.JavaMail.yahoo.ref@mail.yahoo.com>
 <35593366.8510667.1448375044619.JavaMail.yahoo@mail.yahoo.com>
Date: Tue, 24 Nov 2015 17:50:52 +0200
In-Reply-To: <35593366.8510667.1448375044619.JavaMail.yahoo@mail.yahoo.com>
 (Joerg Pommnitz's message of "Tue, 24 Nov 2015 14:24:04 +0000 (UTC)")
Message-ID: <87mvu3qtur.fsf@kamboji.qca.qualcomm.com>
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

> Hello all,
> I'm confused about the git firmware situation for QCA988X.
>
> I'm on linux 3.18.24. The driver want's to load firmware-2.bin. 

With that old version of ath10k you should use 10.1 branch:

https://github.com/kvalo/ath10k-firmware/tree/master/QCA988X/10.1

But I really recommend using newer ath10k, for example by using
backports projects.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
