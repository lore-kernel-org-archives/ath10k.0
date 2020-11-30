Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjg8N-0000ar-3m
 for ath10k@lists.infradead.org; Mon, 30 Nov 2020 10:10:24 +0000
MIME-Version: 1.0
Date: Mon, 30 Nov 2020 18:10:10 +0800
From: Carl Huang <cjhuang@codeaurora.org>
Subject: Re: [PATCH v2 1/3] nl80211: add common API to configure SAR power
 limitations.
In-Reply-To: <CA+ASDXMRPRPD0XFJeHTRv3Bc13VFehkyDoYHQfaA0cP-STDOLg@mail.gmail.com>
References: <20201120085312.4355-1-cjhuang@codeaurora.org>
 <20201120085312.4355-2-cjhuang@codeaurora.org>
 <CA+ASDXMRPRPD0XFJeHTRv3Bc13VFehkyDoYHQfaA0cP-STDOLg@mail.gmail.com>
Message-ID: <8f0121e9996bad2266a928279e7eb26a@codeaurora.org>
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
To: Brian Norris <briannorris@chromium.org>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, Doug Anderson <dianders@chromium.org>, ath10k <ath10k@lists.infradead.org>, Abhishek Kumar <kuabhs@google.com>

On 2020-11-21 10:42, Brian Norris wrote:
> On Fri, Nov 20, 2020 at 12:53 AM Carl Huang <cjhuang@codeaurora.org> 
> wrote:
>> 
>> NL80211_CMD_SET_SAR_SPECS is added to configure SAR from
>> user space. NL80211_ATTR_SAR_SPEC is used to pass the SAR
>> power specification when used with NL80211_CMD_SET_SAR_SPECS.
>> 
>> Wireless driver needs to register SAR type, supported frequency
>> ranges to wiphy, so user space can query it. The index in
>> frequency range is used to specify which sub band the power
>> limitation applies to. The SAR type is for compatibility, so later
>> other SAR mechanism can be implemented without breaking the user
>> space SAR applications.
>> 
>> Normal process is user space quries the SAR capability, and
>> gets the index of supported frequency ranges and associates the
>> power limitation with this index and sends to kernel.
>> 
>> Here is an example of message send to kernel:
>> 8c 00 00 00 08 00 01 00 00 00 00 00 38 00 2b 81
>> 08 00 01 00 00 00 00 00 2c 00 02 80 14 00 00 80
>> 08 00 02 00 00 00 00 00 08 00 01 00 38 00 00 00
>> 14 00 01 80 08 00 02 00 01 00 00 00 08 00 01 00
>> 48 00 00 00
>> 
>> NL80211_CMD_SET_SAR_SPECS:  0x8c
>> NL80211_ATTR_WIPHY:     0x01(phy idx is 0)
>> NL80211_ATTR_SAR_SPEC:  0x812b (NLA_NESTED)
>> NL80211_SAR_ATTR_TYPE:  0x00 (NL80211_SAR_TYPE_POWER)
>> NL80211_SAR_ATTR_SPECS: 0x8002 (NLA_NESTED)
>> freq range 0 power: 0x38 in 0.25dbm unit (14dbm)
>> freq range 1 power: 0x48 in 0.25dbm unit (18dbm)
>> 
>> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> 
> I think the API is reasonably clear and usable. I'm a little skeptical
> that the complexity related to indexes is absolutely necessary [1],
> but at least you make clear what should happen in the case of missing
> indexes (treated as "max"). But you've addressed my concerns, I think:
> 
> Reviewed-by: Brian Norris <briannorris@chromium.org>
> 
> I haven't done the most thorough review on the implementation pieces
> (and ath10k), but I at least wanted to put my thoughts out there.
> 
> Thanks,
> Brian
> 
> [1] By the way, you aren't checking for duplicates; so users could
> pass the same index many times, and it's not clear from the API
> definition what should happen. It seems the current implementation is
> that you'll just use the last value provided.
Thanks for the comments.
It's right the last value is used.
I can describe it more clearly if V3 is needed.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
