Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from nm.newmedia-net.de ([217.113.179.122]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ywz2S-0001Il-EF
 for ath10k@lists.infradead.org; Mon, 25 May 2015 20:31:57 +0000
References: <1431434736-7077-1-git-send-email-michal.kazior@tieto.com>
 <CA+BoTQ=dzJS447Gx+XAXPT6gZDDKZ__6scbxe0QC-iMA47bZmQ@mail.gmail.com>
 <874mn68jl7.fsf@kamboji.qca.qualcomm.com>
 <87oal83kv4.fsf@kamboji.qca.qualcomm.com> <5563577E.4020208@dd-wrt.com>
 <5563584A.80604@candelatech.com> <55636088.1080506@dd-wrt.com>
 <55636198.8020802@candelatech.com> <55637637.8020103@dd-wrt.com>
 <556378E3.7050707@candelatech.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <556386A6.4050908@dd-wrt.com>
Date: Mon, 25 May 2015 22:31:34 +0200
MIME-Version: 1.0
In-Reply-To: <556378E3.7050707@candelatech.com>
Subject: Re: request: ACK timing setting required
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
To: Ben Greear <greearb@candelatech.com>, ath10k@lists.infradead.org

Am 25.05.2015 um 21:32 schrieb Ben Greear:
>
>
> On 05/25/2015 12:21 PM, Sebastian Gottschall wrote:
>> Am 25.05.2015 um 19:53 schrieb Ben Greear:
>>>
>>>
>>> On 05/25/2015 10:48 AM, Sebastian Gottschall wrote:
>>>> Am 25.05.2015 um 19:13 schrieb Ben Greear:
>>>>>
>>>>>
>>>>> On 05/25/2015 10:10 AM, Sebastian Gottschall wrote:
>>>>>> Hello
>>>>>>
>>>>>> could it be possible to add a ACK timing feature to the ath10k 
>>>>>> firmware (QCA9880 internal register 0x8014, mask 0x3FFF)
>>>>>
>>>>> You just need ability to set this register to some value?
>>>>>
>>>>> If so, probably something I could add to CT firmware, at least.
>>>>>
>>>> not alone. this register is rewritten on each reset (channel change 
>>>> etc.) so it needs to be correct handled.
>>>> yes. just writing and handling the ack value would be enough. the 
>>>> math behind is no problem.
>>>> otherwise its impossible todo long range links with ath10k. (LSDK 
>>>> based firmware from compex do support this feature unlike ath10k)
>>>
>>> I'll see if I can add this to my firmware, probably will be a few 
>>> days before I can get
>>> time to work on it.  Will post to list when I have a FW build ready 
>>> for testing.
>> do you plan to bring up your codebase to 10.2.4 with api 5 one time?
>> or is the code already up to date, just using the old api?
>
> I'm having a slow time getting updated source from QCA, but I plan to
> move to a newer code base when I can get access.
>
> For now, my firmware is based on 10.1.467, but it has quite a bit of 
> improvements
> and changes.  It does not support some of the newer chipsets that 
> newer QCA
> firmware supports.
as soon as i have seen each new chipset has a own firmware. the standard 
firmware will only support AR9880 v2.
since i'm only working on embedded devices which are only running on 
AR9880 v2 based chipsets, this isnt a big issue

Sebastian
>
> Thanks,
> Ben
>
>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
