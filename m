Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ew9ZH-0005ly-2u
 for ath10k@lists.infradead.org; Wed, 14 Mar 2018 16:48:05 +0000
Subject: Re: Frames acknowledged and silently discarded in firmware
References: <8B7D031B-8228-493D-8B2C-963C76850F4A@fb.com>
 <48141A86-A8E5-4DF9-A7EC-1E60802680B8@fb.com>
 <CADjYELy+LnHd77X+9YPmHFMoeb3Vx0+JVDgmPd_H1eysUF-sNQ@mail.gmail.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <1c4295b7-8d14-6637-e3b9-ece031d0936e@candelatech.com>
Date: Wed, 14 Mar 2018 09:47:43 -0700
MIME-Version: 1.0
In-Reply-To: <CADjYELy+LnHd77X+9YPmHFMoeb3Vx0+JVDgmPd_H1eysUF-sNQ@mail.gmail.com>
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
To: Thomas Pedersen <thomas@eero.com>, Javier Cardona <jcardona@fb.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 03/13/2018 05:52 PM, Thomas Pedersen wrote:
> Javier,
>
> On Tue, Mar 13, 2018 at 4:42 PM, Javier Cardona <jcardona@fb.com> wrote:
>> Hi,
>>
>> We have resolved this issue.  I'm sharing the details in case that might help others.
>>
>> The description of the problem was accurate EXCEPT that the acks that we observed on the sniffer were not being sent by the failed station (MAP2, in the context of my original e-mail) but by a third station MAP3.  Those Acks were sent by MAP3 but with MAP2's address in the Transmitter Address field.
>>
>> These anomalous Block Acks were sent because the MAC-ADDRESS-FILTER was misconfigured at MAP3, which caused that station to respond to addresses different than its own.  The reasons for this misconfiguration were:
>>   (1) in mesh (and other) mode(s), the driver creates a hidden monitor vif along the mesh vif
>
> At least since some 10.4 firmware, the hidden monitor vdev is no longer
> required. See https://www.spinics.net/lists/linux-wireless/msg156475.html

I'd like to fix my firmware to support this same feature (in case it does not currently
support it) and add the pertinent firmware feature flags.

Can anyone share the filter flag name(s) that needs to be enabled in the firmware for mesh
mode so that monitor devices are not required?

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
