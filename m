Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZA1cW-0006Ee-J8
 for ath10k@lists.infradead.org; Tue, 30 Jun 2015 19:55:05 +0000
Received: by wiwl6 with SMTP id l6so143389049wiw.0
 for <ath10k@lists.infradead.org>; Tue, 30 Jun 2015 12:54:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5592B3BB.2080909@candelatech.com>
References: <5592B3BB.2080909@candelatech.com>
Date: Tue, 30 Jun 2015 21:48:27 +0200
Message-ID: <CALhHN=oaSPrKJJu1kmA=G1ef1RvY5b-vkoOmoZQC3h6x3dg9OQ@mail.gmail.com>
Subject: Re: ANQP to second AP while associated to a first.
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 30 June 2015 at 17:20, Ben Greear <greearb@candelatech.com> wrote:
> In our testing we are trying to do 802.11r roaming with ANQP.
>
> After initial association, we do not see ANQP on the air when trying
> to roam to a new AP.
>
> I think the problem might be that the firmware has issues sending
> packets to a second AP when we are already associated to a first.
>
> I am curious if anyone has successfully tested any sort of
> .11r roaming with ath10k?
>
> And, I am curious if anyone knows if or how ath10k can send
> to a second AP while connected to a different AP  (Like creating a peer for
> the new
> AP, perhaps???)
>
offchannel code - send/receive frames on different channel. I think
you should be able to receive all action frames.

BR
Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
