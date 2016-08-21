Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
MIME-Version: 1.0
In-Reply-To: <CA+uUJGvb6sUXywTvtnyigrkrGSeVEp-2KbndQ_5k5_RxdKgV-Q@mail.gmail.com>
References: <CA+uUJGs7HGamb3duZ_9PYfx++43F3UWE2nO4C3AN9Saen=iMrA@mail.gmail.com>
 <CA+uUJGvb6sUXywTvtnyigrkrGSeVEp-2KbndQ_5k5_RxdKgV-Q@mail.gmail.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Sat, 20 Aug 2016 19:11:57 -0700
Message-ID: <CAJ-Vmo=xh3ij6n1UHH=jC8W1mdsn+kWg9SroSKdm_F6tLMKsDA@mail.gmail.com>
Subject: Re: DFS radar pattern detection in different regions
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
To: Raj Joshi <rajjoshi@comp.nus.edu.sg>
Cc: wireless-regdb@lists.infradead.org, ath10k <ath10k@lists.infradead.org>

I mean, it's done in software, so you can do that if you want to. It
just won't be "right".

Why? :)


-adrian


On 20 August 2016 at 19:05, Raj Joshi <rajjoshi@comp.nus.edu.sg> wrote:
> In simpler terms , I want to know if I could run ath10k on DFS
> channels in countries "outside" of FCC, ETSI and JP regulations?
>
> Thanks,
> Raj Joshi
>
>
> On Tue, Aug 16, 2016 at 10:23 PM, Raj Joshi <rajjoshi@comp.nus.edu.sg> wrote:
>> Hi,
>>
>> I am aware that DFS scan and pattern detection is possible in ath10k
>> or to be precise it is implemented in the ath kernel module. From the
>> source code (dfs_pattern_detector.c), I can see that there are
>> patterns specific to ETSI, FCC and JP regulatory regions.
>>
>> I got some conceptual questions regarding the pattern detection and regulations:
>>
>> Q.1 For a given country, the wireless-regdb [1] specifies one of these
>> 3 regions for DFS. For example, "country AE: DFS-FCC" or "country AF:
>> DFS-ETSI". What does this mean? Does it mean that country AE follows
>> DFS rules of FCC and that country AF follows those of ETSI?
>>
>> Q.2 If the above is the case, then can I run ath10k "correctly" as
>> well as "legally" in country AE, given that pattern detection is
>> implemented for FCC? When I say "correctly", I mean that pattern
>> detection will not have any false negatives. And when I say "legally",
>> I mean that my ath10k device would comply with the local regulations
>> of country AE, given that my device is FCC DFS compliant.
>>
>> It is little hard to believe that all the world's radar patterns could
>> be covered by 3 regulatory standards (FCC, ETSI and JP). Also if that
>> was the case, then ath10k already does a very good job with DFS
>> channels and the new swanky 802.11ac devices such as [2] are simply
>> not worth their price!
>>
>> I would appreciate if someone can provide a clarification around this.
>>
>> Thanks,
>> Raj
>>
>> [1] http://git.kernel.org/cgit/linux/kernel/git/sforshee/wireless-regdb.git/tree/db.txt
>> [2] https://www.kickstarter.com/projects/portalwifi/portal-turbocharged-wifi/description
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
