Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qg0-x230.google.com ([2607:f8b0:400d:c04::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X3gil-00032U-O8
 for ath10k@lists.infradead.org; Sun, 06 Jul 2014 07:18:48 +0000
Received: by mail-qg0-f48.google.com with SMTP id q108so2708706qgd.35
 for <ath10k@lists.infradead.org>; Sun, 06 Jul 2014 00:18:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <21432.58953.39322.640936@gargle.gargle.HOWL>
References: <53B808BF.8070000@candelatech.com>
 <CAJ-Vmo=8pO0eVpL5L28AVALn+rpYPxhOw5kYkaGieBt-RzN3iQ@mail.gmail.com>
 <53B8C4DF.5000308@candelatech.com>
 <CAJ-Vmo=tjqCAns3N2_PY08r6A85Q9e8CoSWCV7g5KCQHRmqN-g@mail.gmail.com>
 <21432.58953.39322.640936@gargle.gargle.HOWL>
Date: Sun, 6 Jul 2014 00:18:25 -0700
Message-ID: <CAJ-Vmo=argSM0Y6buF3+TBSxSN6XgMHsnjh1Js0SW7F9UR-+UA@mail.gmail.com>
Subject: Re: Question on beacon-miss handling.
From: Adrian Chadd <adrian@freebsd.org>
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
To: Sujith Manoharan <sujith@msujith.org>
Cc: Ben Greear <greearb@candelatech.com>, ath10k <ath10k@lists.infradead.org>

On 5 July 2014 23:01, Sujith Manoharan <sujith@msujith.org> wrote:
> Adrian Chadd wrote:
>> Think about it in terms of "minimising how much the host is woken up."
>>
>> That's what the target market of the STA firmware for this chip is
>> thinking about.
>
> I don't think beacon filtering is enabled for ath10k, which means
> all beacons are sent to mac80211 anyway. HW/FW connection monitoring
> (in STA mode) is also not enabled in ath10k, so mac80211's beacon loss/miss
> infrastructure is already used, no ?

Sure, but my response was just describing the "why" behind why the
firmware would want to be doing beacon offload processing.


-a

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
