Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fuf3U-0007B1-AQ
 for ath10k@lists.infradead.org; Tue, 28 Aug 2018 14:33:17 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: retrieve MAC address from firmware if provided
References: <20180810233948.144792-1-briannorris@chromium.org>
 <5B6F2A47.7070502@broadcom.com>
 <CA+ASDXOeybJAsWJtVBdLdQ=6xThJja5MaEoa3dERKZ-shkbDkg@mail.gmail.com>
 <5B71CDFB.60408@broadcom.com>
Date: Tue, 28 Aug 2018 17:33:01 +0300
In-Reply-To: <5B71CDFB.60408@broadcom.com> (Arend van Spriel's message of
 "Mon, 13 Aug 2018 20:29:15 +0200")
Message-ID: <878t4qftnm.fsf@kamboji.qca.qualcomm.com>
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
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: govinds@codeaurora.org, Brian Norris <briannorris@chromium.org>, linux-wireless@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org

Arend van Spriel <arend.vanspriel@broadcom.com> writes:

> On 8/13/2018 7:14 PM, Brian Norris wrote:
>> On Sat, Aug 11, 2018 at 11:26 AM Arend van Spriel
>> <arend.vanspriel@broadcom.com> wrote:
>>>
>>> On 8/11/2018 1:39 AM, Brian Norris wrote:
>>>> Devices may provide their own MAC address via system firmware (e.g.,
>>>
>>> You got me confused by using just "firmware" in the subject.
>>
>> Yeah...I started by writing this patch with device tree specifically
>> (of_get_mac_address()), and then later found that there were generic
>> "device" helpers for this, which can assist with other sorts of
>> firmware nodes. It was easier to put a name on a device tree patch
>> than on a "device" patch. I suppose "system firmware" might be a
>> better description?
>>
>>>> device tree), especially in the case where the device doesn't have a
>>>> useful EEPROM on which to store its MAC address (e.g., for integrated
>>>> Wifi).
>>>>
>>>> Use the generic device helper to retrieve the MAC address, and (if
>>>> present) honor it above the MAC address advertised by the card.
>>>
>>> But this put me back on track ;-)
>>
>> Let me know if you have a better way to clarify. I can resend with a
>> slightly modified subject (s/firmware/system firmware/), or let Kalle
>> do it, if that's the only thing to change.
>
> "system firmware" substitution works for me.

What about:

ath10k: retrieve MAC address from Device Tree if provided

Because from ath10k point of view we use Device Tree functions and don't
care if it's delivered by pidgeons or by system firmware :)

I can change this before I commit.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
