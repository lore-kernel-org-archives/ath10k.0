Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XMLZM-0002MW-Pi
 for ath10k@lists.infradead.org; Tue, 26 Aug 2014 18:34:13 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Malformed AddBA Response prevents clients from associating?
References: <CABnBrYUtF_S+Gh9nwPQwOct1uA5wsLvwW_oxoYYVtWBqiRQROQ@mail.gmail.com>
 <CAJ-VmokR-2SQG-Hb+7yTXG-5X1PQ_VqB1wiYVCdWa17JyAnMTw@mail.gmail.com>
 <CABnBrYUv4tLcmOJLUD99B96jWRwepk1_-6NQ1LdEaCaPQ5QOwg@mail.gmail.com>
 <87sikl6on7.fsf@kamboji.qca.qualcomm.com>
 <CABnBrYWTZrHHnSWMKkwNws7VrEo2drfvQ=4hQUmJ2b13YKB8mw@mail.gmail.com>
Date: Tue, 26 Aug 2014 21:33:45 +0300
In-Reply-To: <CABnBrYWTZrHHnSWMKkwNws7VrEo2drfvQ=4hQUmJ2b13YKB8mw@mail.gmail.com>
 (Denton Gentry's message of "Tue, 26 Aug 2014 09:44:49 -0700")
Message-ID: <878umb14om.fsf@kamboji.qca.qualcomm.com>
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
To: Denton Gentry <denton.gentry@gmail.com>
Cc: Adrian Chadd <adrian@freebsd.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Denton Gentry <denton.gentry@gmail.com> writes:

> I built an image with the 10.2 firmware and left it running with two
> clients disassociating and reassociating every few seconds. After 8
> hours I stopped it, with no failures detected.
>
> I restored the 10.1 firmware, and it failed in 9 minutes. There is a
> substantial amount of randomness, but it generally happens within 2
> hours.
>
> So whatever this issue is, firmware 10.2 does appear to resolve it or
> at least make it way less likely to happen.

That's good to hear, thanks for testing.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
