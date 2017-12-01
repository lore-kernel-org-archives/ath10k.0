Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eKphR-0002cO-Bc
 for ath10k@lists.infradead.org; Fri, 01 Dec 2017 18:06:11 +0000
Subject: Re: ath10k; QCA9984 firmware crash
References: <CA+_ehUwYhLUpZjUmJvcA5iwWTOt6XZKYL9q9aL=NnKhzqpFrDg@mail.gmail.com>
 <1328332e-5506-4cd5-f547-921316e19eee@candelatech.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <786d4078-c8db-4dd8-8988-24980cdeb3e4@candelatech.com>
Date: Fri, 1 Dec 2017 10:05:43 -0800
MIME-Version: 1.0
In-Reply-To: <1328332e-5506-4cd5-f547-921316e19eee@candelatech.com>
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
To: Ansuel Smith <ansuelsmth@gmail.com>, ath10k@lists.infradead.org

On 11/30/2017 09:23 AM, Ben Greear wrote:
> On 11/30/2017 09:04 AM, Ansuel Smith wrote:
>> had this crash when restarting 5ghz wireless. Very bad performance and
>> stability on a netgear r7800. Near wifi are on different channel, with
>> old kernel 4.4 there were no issue. With the new kernel 4.9 i have
>> this kind of problem and a bandwidth of max 20-30 mbps. Can make any
>> test as for now i can't use it due to this problem. (Running lede with
>> latest commit)
>
> I'd be curious if the ath10k-ct driver and firmware worked better
> for you?  Should be easily selectable in LEDE.
>
> Thanks,
> Ben

In case any QCA firmware devs are watching this...the crash in the firmware
seems to be because a peer is being deleted while in power-save mode,
and the send-n logic asserts.

I think I have a fix for this for my firmware, but that does not explain
the other problems that this user sees regarding  descriptor corruption
messages.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
