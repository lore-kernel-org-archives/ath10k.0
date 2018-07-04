Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1faauv-0000lb-Db
 for ath10k@lists.infradead.org; Wed, 04 Jul 2018 06:05:31 +0000
Subject: Re: 160 mhz crash
References: <CA+_ehUzDW8Y9OYYPCijxxGmpp+UZFWySzj0FcQcQDncMu51kjQ@mail.gmail.com>
 <4e8058c7-6443-5b4c-3077-dd0325159854@dd-wrt.com>
 <1788770.Stodcpyumm@bentobox>
 <c5cb2d9f-cbda-be1b-cdd8-cbae3b7886be@dd-wrt.com>
 <87a7r8pdqn.fsf@kamboji.qca.qualcomm.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <9c33b6b5-a088-f8c8-2c50-9f6b00afd6f9@dd-wrt.com>
Date: Wed, 4 Jul 2018 08:05:17 +0200
MIME-Version: 1.0
In-Reply-To: <87a7r8pdqn.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: Ansuel Smith <ansuelsmth@gmail.com>, ath10k@lists.infradead.org, Sven Eckelmann <sven.eckelmann@openmesh.com>



Am 03.07.2018 um 16:58 schrieb Kalle Valo:
> Sebastian Gottschall <s.gottschall@dd-wrt.com> writes:
>
>> Am 28.06.2018 um 08:46 schrieb Sven Eckelmann:
>>> On Samstag, 16. Juni 2018 10:11:27 CEST Sebastian Gottschall wrote:
>>>> this is normal. i already posted a patch on this mailinglist to resolve
>>>> this issue, but
>>>>
>>>> but it hasnt found its way to the main source yes.
>>> Problem seems to be that the patch [1] has obvious style problems and open
>>> questions.
>> i understand that. but i dont see a problem with the code style since
>> the patch is small and not bad looking and on the second hand i was
>> tired to finish the discussion. it was frustrating me anyone is
>> welcome to enhance it.
> And this is why I don't even try to give review comments to your patches
> anymore, as it would be waste of my time as shown above. If you want to
> have your patches applied, you need to have productive attitude and
> willing to receive review comments.
isnt that unproductive attitute on your side?
if you like the bugs in ath10k, you may keep them. on my side the 
problems are fixed in my internal tree.
for sure i just wanted to be nice to give them back to the community, 
but that efforts might be wrong placed here
if that get well ignored.
so "i dont want my patch applied" its not about pushing my ego here.
you should want the bugs beeing fixed, no matter if its done with my 
patch or just with my solution for the problem.


> I have been hoping to clean up the patch myself, but I have not managed
> to do it yet. If someone else can jump in and finish the patch, I would
> be very grateful. I think the biggest work is to cleanup all the
> checkpatch warnings and add a check for the WMI service flag.
to be honest. its the first time i saw that checkpatch warning and 
locally checkpatch isnt working for me
this tool itself is full of bugs and not working on my host system
and if i rewrite lines like
(BW_NSS_FWCONF_MAP_ENABLE | (((x - 1) << BW_NSS_FWCONF_MAP_160MHZ_S) & 
BW_NSS_FWCONF_MAP_160MHZ_M))
to match the checkpatch rules, they turn unreadable as i said already. 
so i believe also that checkpatch isnt a solution at all
since the rules are too restrictive for some code
for sure we can shorten down all words to be more unreadable. but that 
doesnt make sense for me

i will fork the latest ath10k code from git today and try to recreate 
the patch with all tabs and spaces correctly set.
>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
