Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WJ3W5-00037O-CP
 for ath10k@lists.infradead.org; Thu, 27 Feb 2014 16:08:58 +0000
Message-ID: <530F62FD.9060701@candelatech.com>
Date: Thu, 27 Feb 2014 08:08:29 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Need to get msdu-chaining working.
References: <530E7AF2.1080908@candelatech.com>
 <CA+BoTQmr6+9wJ87pOmzPEBwPCMG5emfkfcUmzxXpH6gVPW+zFw@mail.gmail.com>
In-Reply-To: <CA+BoTQmr6+9wJ87pOmzPEBwPCMG5emfkfcUmzxXpH6gVPW+zFw@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: ath10k <ath10k@lists.infradead.org>

On 02/26/2014 10:51 PM, Michal Kazior wrote:
> On 27 February 2014 00:38, Ben Greear <greearb@candelatech.com> wrote:
>>
>> I'm using raw-rx mode in my firmware, and it's throughput is
>> extremely poor at higher speeds.  I see large numbers of warnings
>> about msdu_chaining, so I suspect this may be the reason.
>
> I assume this requires your custom FW?

Yes.  I am not sure you can use raw tx with standard firmware (yet)?

Or at least, you cannot have tx cooked and rx raw.

>> Does anyone have any suggestions for what needs to be done
>> to handle these sorts of frames properly?
>>
>>                          /* FIXME: we do not support chaining yet.
>>                           * this needs investigation */
>>                          if (msdu_chaining) {
>>                                  ath10k_warn("htt rx msdu_chaining is true\n");
>>                                  ath10k_htt_rx_free_msdu_chain(msdu_head);
>>                                  continue;
>>                          }
>
>>From what I understand chained msdu is a msdu that hasn't fit into the
> rx buffer and is split across the popped amsdu list. I suspect only
> the first msdu in chain has the htt_rx_desc and all other have not
> (this is what the current code does, but you'll need to verify that).
>
> I would try to concatenate all msdus into one (lots of memcpy :( ) or
> increase the HTT_RX_BUF_SIZE so that A-MSDU frames can fit into a
> single buffer (hopefully FW/HW is capable of doing that).

I think in raw mode the hardware/firmware may not try to re-assemble the skb,
or also when no peer object can be found.  This might be an issue in monitor
mode as well, but I'm not certain about that.

I think there is a way to chain skb data chunks w/out doing the copying,
but I am not certain how that would be done properly.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
