Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cjazp-0006x0-4n
 for ath10k@lists.infradead.org; Fri, 03 Mar 2017 00:23:00 +0000
Received: by mail-wm0-x232.google.com with SMTP id v186so4058021wmd.0
 for <ath10k@lists.infradead.org>; Thu, 02 Mar 2017 16:22:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <2d0b3ee6-5f23-079b-7c07-a25f69b392b2@dd-wrt.com>
References: <8f2382ad-4778-f32d-762c-09c543e93afd@candelatech.com>
 <5753f0bb-be72-c64c-2eb4-7a4ac27894b9@dd-wrt.com>
 <96573cb0-9154-0687-0890-945597002108@candelatech.com>
 <b8f4c91b-0adb-ade9-5287-acb9082f50b0@dd-wrt.com>
 <CAJ-VmomO8jpfnDpm30vJNv-pbRmQvNHjQsNAEVv7E+fz1WVkvw@mail.gmail.com>
 <2d0b3ee6-5f23-079b-7c07-a25f69b392b2@dd-wrt.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Thu, 2 Mar 2017 16:22:34 -0800
Message-ID: <CAJ-VmomhM_o7Jz5yw4gfOFHiXrKa-jFL9hk06F7MzMLvZnHUgQ@mail.gmail.com>
Subject: Re: ath10k bug in station mode with regard to TX-BEAMFORMER?
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
Cc: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 2 March 2017 at 16:08, Sebastian Gottschall <s.gottschall@dd-wrt.com> wrote:
> Am 03.03.2017 um 00:30 schrieb Adrian Chadd:
>>
>> On 2 March 2017 at 14:53, Sebastian Gottschall <s.gottschall@dd-wrt.com>
>> wrote:
>>
>>>> Did you patch supplicant?  If so, can you point me to the change(s) you
>>>> made?
>>>
>>> nope. i just used its features. there is a config entry named "vht_capa"
>>> and
>>> "vht_capa_mask" which allows to mask out / in vht capabilities
>>
>> RIght, but you just disabled the capabilities entirely, right? That
>> didn't fix negotiation?
>
> there wasnt a problem with negotiation.  there was a problem with firmware
> crashes and yes i disabled the crash cause in that way

Well, the crash is a bad case of "I shouldn't handle a broken AP by crashing."

But an AP shouldn't be saying "mu-beamformee" according to the
standard, but mu-beamformer. (or the other way around, I forget - but
whatever Ben showed me, it was certainly announcing the /opposite/ of
what it should be doing.)



-adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
