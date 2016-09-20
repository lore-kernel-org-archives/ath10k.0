Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bmCxD-0003JS-U9
 for ath10k@lists.infradead.org; Tue, 20 Sep 2016 04:46:48 +0000
Message-ID: <57E0BBFF.4070206@candelatech.com>
Date: Mon, 19 Sep 2016 21:33:03 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Issue with ATH10K driver with 802.11 a/g mode datarates
References: <20160919041857.M30046@universe.cdotb.ernet.in>
 <57E01220.3060302@candelatech.com>
 <CAJ-Vmo=NfyiFLj8oDkSEHaGbeS8WEdc0RNDZYigw8LtQtnNYmA@mail.gmail.com>
 <20160920033049.M23541@cdot.in>
In-Reply-To: <20160920033049.M23541@cdot.in>
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
To: Sridhar Konabathini <sridhark@cdot.in>, Adrian Chadd <adrian@freebsd.org>
Cc: Horse <horse@gentrice.net>, Raj Joshi <rajjoshi@comp.nus.edu.sg>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Michal Kazior <michal.kazior@tieto.com>

LANforge is going to be running a modified driver and firmware, though likely
it is no worse at performance in this case than stock code.

What is the device under test?

And, are you in an isolation chamber, using SMA cables, attenuation, etc?

There are lots of things that can impact wifi throughput so you have to provide
lots more details in order for anyone to understand why the throughput might be
less than expected.

And if it is specific to LANforge, please send email to support@candelatech.com

Thanks,
Ben


On 09/19/2016 08:46 PM, Sridhar Konabathini wrote:
> Hi,
>      I didnt try with ath9k drivers on the same setup.
>
>      we are using  WiFi capacity test tool on Lanforge to test the performance, this will
> generate the traffic. we are selecting the UDP protocol (packet - 1472 Bytes).
>
>      As per TEC spec. required data rates are given below.
>
>      Mode         Asso. rate         Throughput
>
> 802.11a            54 Mbps             28 Mbps
>
> 802.11g            54 Mbps             28 Mbps
>
>      But we are getting only 26-27Mbps, how to improve this throughput ?
>
>      [TEC(Telecommunication Engineering Centre, Govt. India) is a technical body,
> prepares specification of common Telecom standards.]
>
> Regards,
> Sridhar
>
>
> On Mon, 19 Sep 2016 10:22:26 -0700, Adrian Chadd wrote
>> .... and what's "TEC specification" ?
>>
>> -
>> a
>>
>> On 19 September 2016 at 09:28, Ben Greear <greearb@candelatech.com> wrote:
>>> Out of curiosity, does ath9k perform at the required rates in a similar
>>> setup?
>>>
>>> Sending tcp, udp, or some other protocol?  How are you generating the
>>> traffic?
>>>
>>> Thanks,
>>> Ben
>>>
>>>
>>> On 09/18/2016 09:26 PM, Sridhar Kondabathini wrote:
>>>>
>>>> Hi,
>>>>
>>>>       When we are testing 802.11 a/g mode throughput measurements on
>>>> T1024RDB ( we used
>>>> kernel-3.12; ath10k drivers backported from 4.4;hostapd 2.5 for 11AC
>>>> support), then we
>>>> are getting 26-27 Mbps , which is not meeting the required TEC
>>>> specification (which is
>>>> ~28 Mbps). How can we increase the throughput in these modes.
>>>>
>>>>        Can you please help on this.
>>>>
>>>>
>>>>
>>>> Regards,
>>>>
>>>> Sridhar Kondabathini,
>>>> Research engineer,
>>>> PSG lab,
>>>> Center for Development Of Telematics
>>>> 9480484821.
>>>>
>>>>
>>>>
>>>>
>>>> Disclaimer:
>>>> ----------
>>>> This email and any files transmitted with it are confidential and intended
>>>> solely
>>>> for
>>>> the use of the individual or entity to whom they are addressed.  If you
>>>> are not the
>>>> intended recipient you are notified that disclosing, copying, distributing
>>>> or taking
>>>> any
>>>> action in reliance on the contents of this information is strictly
>>>> prohibited. The
>>>> sender does not a
>>>>
>>>>
>>>> _______________________________________________
>>>> ath10k mailing list
>>>> ath10k@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/ath10k
>>>>
>>>
>>>
>>> --
>>> Ben Greear <greearb@candelatech.com>
>>> Candela Technologies Inc  http://www.candelatech.com
>>>
>>>
>>>
>>> _______________________________________________
>>> ath10k mailing list
>>> ath10k@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/ath10k
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k
>
>
> Regards,
>
> Sridhar Kondabathini,
> Research engineer,
> PSG lab,
> Center for Development Of Telematics
> 9480484821.
>
>
>
>
> Disclaimer:
> ----------
> This email and any files transmitted with it are confidential and intended solely
> for
> the use of the individual or entity to whom they are addressed.  If you are not the
> intended recipient you are notified that disclosing, copying, distributing or taking
> any
> action in reliance on the contents of this information is strictly prohibited. The
> sender does not a
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
