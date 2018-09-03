Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fws3K-00048D-IX
 for ath10k@lists.infradead.org; Mon, 03 Sep 2018 16:50:16 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: retrieve MAC address from firmware if provided
References: <20180810233948.144792-1-briannorris@chromium.org>
 <5B6F2A47.7070502@broadcom.com>
 <CA+ASDXOeybJAsWJtVBdLdQ=6xThJja5MaEoa3dERKZ-shkbDkg@mail.gmail.com>
 <5B71CDFB.60408@broadcom.com>
 <878t4qftnm.fsf@kamboji.qca.qualcomm.com>
 <20180829001453.GA173345@ban.mtv.corp.google.com>
Date: Mon, 03 Sep 2018 19:49:58 +0300
In-Reply-To: <20180829001453.GA173345@ban.mtv.corp.google.com> (Brian Norris's
 message of "Tue, 28 Aug 2018 17:14:54 -0700")
Message-ID: <87ftyq8r0p.fsf@kamboji.qca.qualcomm.com>
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
To: Brian Norris <briannorris@chromium.org>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>, govinds@codeaurora.org, linux-wireless@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org

Brian Norris <briannorris@chromium.org> writes:

> On Tue, Aug 28, 2018 at 05:33:01PM +0300, Kalle Valo wrote:
>> Arend van Spriel <arend.vanspriel@broadcom.com> writes:
>> 
>> > On 8/13/2018 7:14 PM, Brian Norris wrote:
>> >> On Sat, Aug 11, 2018 at 11:26 AM Arend van Spriel
>> >> <arend.vanspriel@broadcom.com> wrote:
>> >>>
>> >>> On 8/11/2018 1:39 AM, Brian Norris wrote:
>> >>>> Devices may provide their own MAC address via system firmware (e.g.,
>> >>>
>> >>> You got me confused by using just "firmware" in the subject.
>> >>
>> >> Yeah...I started by writing this patch with device tree specifically
>> >> (of_get_mac_address()), and then later found that there were generic
>> >> "device" helpers for this, which can assist with other sorts of
>> >> firmware nodes. It was easier to put a name on a device tree patch
>> >> than on a "device" patch. I suppose "system firmware" might be a
>> >> better description?
>> >>
>> >>>> device tree), especially in the case where the device doesn't have a
>> >>>> useful EEPROM on which to store its MAC address (e.g., for integrated
>> >>>> Wifi).
>> >>>>
>> >>>> Use the generic device helper to retrieve the MAC address, and (if
>> >>>> present) honor it above the MAC address advertised by the card.
>> >>>
>> >>> But this put me back on track ;-)
>> >>
>> >> Let me know if you have a better way to clarify. I can resend with a
>> >> slightly modified subject (s/firmware/system firmware/), or let Kalle
>> >> do it, if that's the only thing to change.
>> >
>> > "system firmware" substitution works for me.
>> 
>> What about:
>> 
>> ath10k: retrieve MAC address from Device Tree if provided
>> 
>> Because from ath10k point of view we use Device Tree functions and don't
>> care if it's delivered by pidgeons or by system firmware :)
>
> I don't care too much, but note that Device Tree is a loaded term,
> usually referring specifically to a method of describing system hardware
> via the Flattened Device Tree format. If I were specifically targeting
> Device Tree, I'd use helpers like of_get_mac_address() instead. (The
> 'of_*' prefix is a relic of OpenFirmware, an early firmware
> implementation that used the Device Tree format.)

My bad, I read your patch hastily and somehow understood you were using
of_get_mac_address() but you were actually using
device_get_mac_address(). So I'll change this to "system firmware" as
originally suggested.

Sorry for the confusion.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
