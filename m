Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXqcH-0006v1-G9
 for ath10k@lists.infradead.org; Wed, 09 Apr 2014 11:24:30 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k FAQ
References: <8761mkmfny.fsf@kamboji.qca.qualcomm.com>
 <CAHqTa-1DMgZBW9aqHEXjEy=PWytk88S-kiy3kOqtiGDWLi==cA@mail.gmail.com>
Date: Wed, 9 Apr 2014 14:24:02 +0300
In-Reply-To: <CAHqTa-1DMgZBW9aqHEXjEy=PWytk88S-kiy3kOqtiGDWLi==cA@mail.gmail.com>
 (Avery Pennarun's message of "Tue, 8 Apr 2014 19:56:36 -0400")
Message-ID: <87zjjuiw4t.fsf@kamboji.qca.qualcomm.com>
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
To: Avery Pennarun <apenwarr@gmail.com>
Cc: ath10k <ath10k@lists.infradead.org>

Avery Pennarun <apenwarr@gmail.com> writes:

> On Tue, Apr 8, 2014 at 3:41 AM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> I created a small FAQ to the wiki and added the four questions which
>> seem to be popular:
>>
>> http://wireless.kernel.org/en/users/Drivers/ath10k/faq
>>
>> Comments welcome. And feel free to update it with new questions.
>
> This seems helpful.

Especially for me as now I can just answer with an URL ;)

> For the first question ("can't set channel") I think the provided
> answer is not the only cause of the problem, and was not the one that
> confused me at first. For me, the main confusion was that it's pretty
> non-intuitive how to set the 80 MHz center frequency in hostapd.conf
> ("the center frequency of the channel 6 higher than the lowest channel
> number in the 4-channel group"). It might help if you could include an
> example for that. I guess it varies by country so it might be a little
> tricky.

Good point. I tried to improve the answer a bit now:

----------------------------------------------------------------------
Why I cannot start an AP in an 80 MHz channel / in 11ac mode?

If you get "nl80211: Failed to set channel" error from hostapd, most
likely that means that regulatory database doesn't support 80 MHz
channels (which were introduced in 11ac). You can check that with iw:

$ iw reg get
country FI: DFS-ETSI
        (2402 - 2482 @ 40), (N/A, 20)
        (5170 - 5250 @ 80), (N/A, 20)
        (5250 - 5330 @ 80), (N/A, 20), DFS
        (5490 - 5710 @ 80), (N/A, 27), DFS
        (57240 - 65880 @ 2160), (N/A, 40), NO-OUTDOOR

If you do not see "@ 80" within the frequency range you are using, it
means that the regulatory database doesn't support 80 MHz channels.

Other problem is that configuring VHT (= 802.11ac) in hostapd is not
very intuitive, pay extra attention how you configure it. Especially
vht_oper_centr_freq_seg0_idx is challenging. See example configuration
and hostapd configuration file documentation.
----------------------------------------------------------------------

I'm trying to maintain all configuration related documentation in
respective pages and that's why I just have pointers in the FAQ.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
