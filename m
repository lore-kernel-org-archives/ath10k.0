Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkBR3-0006iR-0W
 for ath10k@lists.infradead.org; Wed, 14 Sep 2016 14:45:14 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: QCA9984 VHT160 support
Date: Wed, 14 Sep 2016 14:44:42 +0000
Message-ID: <8737l2ee1y.fsf@kamboji.qca.qualcomm.com>
References: <CA+uUJGtXNAe=FRgYTVDNf6aNVE78CMSs+gLj-bQgA_=hFZibaA@mail.gmail.com>
 <57320C1A.3040604@candelatech.com>
 <CA+uUJGukss2Z7i=k0OvERWvkzMGwBFTaY6R_TL5sGo4yXKQFsA@mail.gmail.com>
 <57335A43.4050902@candelatech.com>
 <CA+uUJGsVi0OiwK4D6n-ANXRm6ptiTdjvKNboXobwn4FA0YfsRQ@mail.gmail.com>
 <573892F5.40706@candelatech.com> <5738AE96.8040800@candelatech.com>
 <CA+uUJGuMrDoXat3rD2AeHTLZUCUDPHXhHVy==62mGLN01O8Vdw@mail.gmail.com>
 <87mvnp6ser.fsf@kamboji.qca.qualcomm.com>
 <572a14ee-d1b5-7b85-d292-51f583f34f17@dd-wrt.com>
 <87lgyug42q.fsf@kamboji.qca.qualcomm.com>
 <bd2ae01e-6cf5-837e-5573-1d62bbfdbe1b@dd-wrt.com>
In-Reply-To: <bd2ae01e-6cf5-837e-5573-1d62bbfdbe1b@dd-wrt.com> (Sebastian
 Gottschall's message of "Wed, 14 Sep 2016 16:38:39 +0200")
Content-Language: en-US
Content-ID: <374B978C33659A4F953D352AC1C6F6A4@qualcomm.com>
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Sebastian Gottschall <s.gottschall@dd-wrt.com> writes:

> Am 14.09.2016 um 12:37 schrieb Valo, Kalle:
>> Sebastian Gottschall <s.gottschall@dd-wrt.com> writes:
>>
>>> Attached you will find a testing patch for VHT160 support. i tested it
>>> today on a QCA9984 device and it seems to work.
>>> feel free to make any corrections
>> Signed-off-by is missing so I can't take this. Can you resend, please
>
> i can send you a updated version. it tested with vht160 so far.

Great, thanks.

> however. on codeaurore there is a newer firmware for 9984 which
> provides the correct vht flags straight from the firmware but its
> crashing in vht160 mode. can you ask the firmware team to provide a
> bugfixed version for the official ath10k? with 80p80 and vht160
> support? 80p80 works somewhat bug has wrong vht flags per station,
> vht160 works with my quirks so far which are all related to the buggy
> firmware

I can ask but I need more info. What's the exact location of the newer
firmware image? Is there any detailed description about the wrong vht
flags bug?

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
