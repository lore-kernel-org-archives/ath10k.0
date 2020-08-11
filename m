Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.as201155.net ([185.84.6.188])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5TBG-0002xP-4N
 for ath10k@lists.infradead.org; Tue, 11 Aug 2020 12:15:04 +0000
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]:39224
 helo=webmail.newmedia-net.de)
 by mail.as201155.net with esmtps (TLSv1:DHE-RSA-AES256-SHA:256)
 (Exim 4.82_1-5b7a7c0-XX) (envelope-from <s.gottschall@dd-wrt.com>)
 id 1k5TBB-0006Pj-0K
 for ath10k@lists.infradead.org; Tue, 11 Aug 2020 14:14:57 +0200
Subject: Re: WMM not working for mcast packets on ath10k
References: <CANczwAH=3UvKNnN3Zhkbdizi8vf0vUFkNNFEX-op0gr8Stj5LQ@mail.gmail.com>
 <7bdee5c8-c271-0902-510c-d8a41b7ec4b8@candelatech.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Message-ID: <bbc46d8f-1f10-6c99-24d4-10e0d713b23b@dd-wrt.com>
Date: Tue, 11 Aug 2020 14:14:55 +0200
MIME-Version: 1.0
In-Reply-To: <7bdee5c8-c271-0902-510c-d8a41b7ec4b8@candelatech.com>
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
To: ath10k@lists.infradead.org

Am 11.08.2020 um 01:05 schrieb Ben Greear:

> On 8/10/20 3:08 PM, Ahmed Zaki wrote:
>> Hello,
>>
>> I have 2 ath10k devices set in Mesh Point mode. When I use iptables'
>> DSCP target to set the WMM AC for some traffic ports to VO, the rules
>> work fine but only for unicast packets. All broadcast on the target
>> UDP ports goes out as BE, and not VO.
>>
>> With some ath10k debugging enabled, it seems that the htt is indeed
>> sending the tx descriptor with the correct tid (6) set.
>>
>> Is this the intended behavior for some reason? If not, is there any
>> more debugging on the TX path that I can do?
>
> I don't think that WMM makes sense for bcast frames since they go out on
> a special TID that does not do aggregation or per peer QoS settings.
and in addition broadcast frames are transmitted with legacy rates (2 
mbit by default, but can be changed)
>
> Thanks,
> Ben
>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
