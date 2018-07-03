Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1faMlv-0001m2-OR
 for ath10k@lists.infradead.org; Tue, 03 Jul 2018 14:59:19 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: 160 mhz crash
References: <CA+_ehUzDW8Y9OYYPCijxxGmpp+UZFWySzj0FcQcQDncMu51kjQ@mail.gmail.com>
 <4e8058c7-6443-5b4c-3077-dd0325159854@dd-wrt.com>
 <1788770.Stodcpyumm@bentobox>
 <c5cb2d9f-cbda-be1b-cdd8-cbae3b7886be@dd-wrt.com>
Date: Tue, 03 Jul 2018 17:58:56 +0300
In-Reply-To: <c5cb2d9f-cbda-be1b-cdd8-cbae3b7886be@dd-wrt.com> (Sebastian
 Gottschall's message of "Thu, 28 Jun 2018 11:56:02 +0200")
Message-ID: <87a7r8pdqn.fsf@kamboji.qca.qualcomm.com>
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: Ansuel Smith <ansuelsmth@gmail.com>, ath10k@lists.infradead.org, Sven Eckelmann <sven.eckelmann@openmesh.com>

Sebastian Gottschall <s.gottschall@dd-wrt.com> writes:

> Am 28.06.2018 um 08:46 schrieb Sven Eckelmann:
>> On Samstag, 16. Juni 2018 10:11:27 CEST Sebastian Gottschall wrote:
>>> this is normal. i already posted a patch on this mailinglist to resolve
>>> this issue, but
>>>
>>> but it hasnt found its way to the main source yes.
>> Problem seems to be that the patch [1] has obvious style problems and open
>> questions.
>
> i understand that. but i dont see a problem with the code style since
> the patch is small and not bad looking and on the second hand i was
> tired to finish the discussion. it was frustrating me anyone is
> welcome to enhance it.

And this is why I don't even try to give review comments to your patches
anymore, as it would be waste of my time as shown above. If you want to
have your patches applied, you need to have productive attitude and
willing to receive review comments.

I have been hoping to clean up the patch myself, but I have not managed
to do it yet. If someone else can jump in and finish the patch, I would
be very grateful. I think the biggest work is to cleanup all the
checkpatch warnings and add a check for the WMI service flag.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
