Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ob0-x229.google.com ([2607:f8b0:4003:c01::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXLGo-0004Fg-Vw
 for ath10k@lists.infradead.org; Thu, 03 Sep 2015 03:33:04 +0000
Received: by obuk4 with SMTP id k4so25243626obu.2
 for <ath10k@lists.infradead.org>; Wed, 02 Sep 2015 20:32:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55E743F3.1060802@candelatech.com>
References: <CAEFj984QMQrsDPuThJCnnDj=vDFAeHwkdVT2MA0PXvhCAL2Hcw@mail.gmail.com>
 <55E743F3.1060802@candelatech.com>
Date: Thu, 3 Sep 2015 11:32:41 +0800
Message-ID: <CAEFj984KSFw6a6kQTMO_80MM+tZqbQo3hq=faKWtS+oxk14zkQ@mail.gmail.com>
Subject: Re: HT80 monitoring using ath10k
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Thu, Sep 3, 2015 at 2:46 AM, Ben Greear <greearb@candelatech.com> wrote:
> On 09/01/2015 06:20 PM, Yeoh Chun-Yeow wrote:
>>
>> Hi, all
>>
>> Anyone has able to capture the packet sent using HT80 or even higher
>> putting ath10k in monitor mode?
>>
>> Please let me know. Thanks
>
>
> I guess it would require wave-2 hardware to even have a chance of HT160?
>
> I thought HT80 capture worked fine on peregrine....I should have a chance to
> try this for some upcoming IBSS work I have scheduled for my 10.1 firmware.

Did you ever try it before with HT80?

I set using the following after bring up the interface:
iw moni0 set freq 5180 80 5210

But not seeing any data packet and just those mgmt frame.

---
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
