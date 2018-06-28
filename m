Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fYTey-0004ID-79
 for ath10k@lists.infradead.org; Thu, 28 Jun 2018 09:56:18 +0000
Subject: Re: 160 mhz crash
References: <CA+_ehUzDW8Y9OYYPCijxxGmpp+UZFWySzj0FcQcQDncMu51kjQ@mail.gmail.com>
 <4e8058c7-6443-5b4c-3077-dd0325159854@dd-wrt.com>
 <1788770.Stodcpyumm@bentobox>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <c5cb2d9f-cbda-be1b-cdd8-cbae3b7886be@dd-wrt.com>
Date: Thu, 28 Jun 2018 11:56:02 +0200
MIME-Version: 1.0
In-Reply-To: <1788770.Stodcpyumm@bentobox>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sven Eckelmann <sven.eckelmann@openmesh.com>, ath10k@lists.infradead.org
Cc: Ansuel Smith <ansuelsmth@gmail.com>



Am 28.06.2018 um 08:46 schrieb Sven Eckelmann:
> On Samstag, 16. Juni 2018 10:11:27 CEST Sebastian Gottschall wrote:
>> this is normal. i already posted a patch on this mailinglist to resolve
>> this issue, but
>>
>> but it hasnt found its way to the main source yes.
> Problem seems to be that the patch [1] has obvious style problems and open
> questions.
i understand that. but i dont see a problem with the code style since 
the patch is small and not bad looking and on the second hand i was 
tired to finish the discussion. it was frustrating me
anyone is welcome to enhance it. without it, the firmware will simply 
crash. so its at least usefull to bring it in, in someway. it wont have 
bad consequences.
consider also that the patch itself is basicly a port of the behaviour 
of the propertiery qca driver. so think its correct and i'm running this 
patch for months now
but another thing is that 2 patches are required for getting 160 mhz to 
work. the first one which is required since firmware 3.4 was already 
posted by me 2 years ago if i'm correct.
without the first patch 160 does not work at all. the second patch 
posted 2 months ago is for 3.5 or newer but requires the first patch as well

Sebastian
>
> Kind regards,
> 	Sven
>
> [1] https://patchwork.kernel.org/patch/10372949/


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
