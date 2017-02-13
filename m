Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdMHe-0002ES-Qd
 for ath10k@lists.infradead.org; Mon, 13 Feb 2017 19:27:37 +0000
Received: by mail-wm0-x22d.google.com with SMTP id r141so102337454wmg.1
 for <ath10k@lists.infradead.org>; Mon, 13 Feb 2017 11:27:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <d53a8fac-b4e0-2fb2-c1e1-c537a2c5e8aa@candelatech.com>
References: <0082a9e3-83f3-9bc3-af43-b890b91cfd93@candelatech.com>
 <1486969571.5142.3.camel@sipsolutions.net>
 <d53a8fac-b4e0-2fb2-c1e1-c537a2c5e8aa@candelatech.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Mon, 13 Feb 2017 11:27:10 -0800
Message-ID: <CAJ-Vmo=F22na+nGpbsBjnHfWKG5EGJXM+BQoee_jsZL7y4xLTw@mail.gmail.com>
Subject: Re: VHT 160Mhz and nss related config.
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
Cc: Johannes Berg <johannes@sipsolutions.net>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

.. or give us a legit way to acquire the 2016 spec? :)

Curious implementers want to know!



-a

On 13 February 2017 at 11:21, Ben Greear <greearb@candelatech.com> wrote:
> On 02/12/2017 11:06 PM, Johannes Berg wrote:
>>
>> On Fri, 2017-02-10 at 14:58 -0800, Ben Greear wrote:
>>>
>>> So, it appears that the ath10k QCA9984 4x4 160Mhz chip can do 4x4
>>> MIMO at VHT80, but
>>> it can do only 2x2 MIMO at VHT160/80+80.
>>>
>>> When configuring a peer, we need to tell the firmware the number of
>>> spatial streams
>>> of the peer at VHT160 and at VHT80 and lower.  They are not the same
>>> value.
>>>
>>> I cannot think of any standard way to get this information based on
>>> VHT capabilities and such.  Currently, one could just assume VHT160
>>> NSS is 1/2 of the VHT80 NSS, but that is unlikely to be true for all
>>> vendors.
>>
>>
>> This was recently added to the VHT capabilities in the spec, see Table
>> 9-250 in 802.11-2016.
>>
>> johannes
>>
>
> I don't have that spec...maybe you could post a patch that adds that flag
> and/or other fields to the appropriate header files?  I can attempt to
> add support to ath10k after that...
>
>
> Thanks,
> Ben
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
