Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x22f.google.com ([2a00:1450:400c:c0c::22f])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cm2FF-00005L-0o
 for ath10k@lists.infradead.org; Thu, 09 Mar 2017 17:52:59 +0000
Received: by mail-wr0-x22f.google.com with SMTP id u108so50082489wrb.3
 for <ath10k@lists.infradead.org>; Thu, 09 Mar 2017 09:52:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87o9xa4oqb.fsf@kamboji.qca.qualcomm.com>
References: <7312b473-4dec-5fec-8642-8233689f4d8a@candelatech.com>
 <87lgse6hmf.fsf@kamboji.qca.qualcomm.com> <58C14C2D.902@candelatech.com>
 <87o9xa4oqb.fsf@kamboji.qca.qualcomm.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Thu, 9 Mar 2017 09:52:34 -0800
Message-ID: <CAJ-VmomgksTfjSeA9o+ci2dLwad6ihAWm4s68M70JhyTq=6miA@mail.gmail.com>
Subject: Re: Please update board-2.bin for QCA9888
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: Ben Greear <greearb@candelatech.com>, ath10k <ath10k@lists.infradead.org>

Hi,

Whilst you're at it, the DK07 2G/5G-low and DK07 5G-high/5G-high board
values would be good to add too. They're the same bmi-id though;
there's a jumper to select radio0 as "2G or 5G-high RF path". You'd
have to add them as separate files that people can select at runtime.
:)

I think there's also the file for the DK07+Cascade and DK07+Besra
5G-low NICs that aren't in there by default. Lemme go dig up which
files to use from where.

Thanks!



-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
