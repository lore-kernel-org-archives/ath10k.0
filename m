Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28]
 helo=alexa-out-lv-02.qualcomm.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dhz5x-0004yZ-JB
 for ath10k@lists.infradead.org; Wed, 16 Aug 2017 14:14:55 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k firmware-6.bin bug: Disconnections every 20 minutes on
 QCA6174
Date: Wed, 16 Aug 2017 14:14:22 +0000
Message-ID: <87lgmj7g75.fsf@kamboji.qca.qualcomm.com>
References: <CAPYrjBWL8LmVyWcXRZZDE1pEpwq-E6vRh5Ed_kG=ieZfsZdeiA@mail.gmail.com>
In-Reply-To: <CAPYrjBWL8LmVyWcXRZZDE1pEpwq-E6vRh5Ed_kG=ieZfsZdeiA@mail.gmail.com>
 (Kouroche Bouchiat's message of "Mon, 7 Aug 2017 00:10:28 +0200")
Content-Language: en-US
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
To: Kouroche Bouchiat <kouroche.bouchiat@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Kouroche Bouchiat <kouroche.bouchiat@gmail.com> writes:

> On hw3.0/firmware-6.bin my QCA6174 seems to be dropping 100% of
> packets after exactly 20 minutes. I talked to people over on the
> Archlinux forums who suggested to force the kernel to load
> firmware-4.bin instead. I did just that ("mv firmware-6.bin
> firmware-6.bin.bak") and my connection seems to be working fine now.
> The forum thread is the following:
> https://bbs.archlinux.org/viewtopic.php?id=228793

I suspect that this is a WPA rekeying problem, are you able to verify
that? Anyway, I reported this internally.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
