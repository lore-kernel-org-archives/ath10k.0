Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6bIm-0006fM-T3
 for ath10k@lists.infradead.org; Tue, 15 Nov 2016 10:49:23 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [RFC 09/12] ath10k: Mailbox address definitions
Date: Tue, 15 Nov 2016 10:48:36 +0000
Message-ID: <871sydrpbu.fsf@qca.qualcomm.com>
References: <1479141222-8493-1-git-send-email-erik.stromdahl@gmail.com>
 <1479141222-8493-10-git-send-email-erik.stromdahl@gmail.com>
 <CA+BoTQnohNffDOt_mYRuATv9wBAvOy=t6hGdS9MVRkZuwRE1nA@mail.gmail.com>
In-Reply-To: <CA+BoTQnohNffDOt_mYRuATv9wBAvOy=t6hGdS9MVRkZuwRE1nA@mail.gmail.com>	(Michal
 Kazior's message of "Tue, 15 Nov 2016 11:31:28 +0100")
Content-Language: en-US
Content-ID: <16AB8240C07BCB4AA55365B498CC2C52@qualcomm.com>
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
To: "michal.kazior@tieto.com" <michal.kazior@tieto.com>
Cc: Erik Stromdahl <erik.stromdahl@gmail.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 14 November 2016 at 17:33, Erik Stromdahl <erik.stromdahl@gmail.com> wrote:
>> Address definitions for SDIO/mbox based chipsets.
>>
>> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
>> ---
>>  drivers/net/wireless/ath/ath10k/hw.h |   53 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 53 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/hw.h b/drivers/net/wireless/ath/ath10k/hw.h
>> index 883547f..46142e9 100644
>> --- a/drivers/net/wireless/ath/ath10k/hw.h
>> +++ b/drivers/net/wireless/ath/ath10k/hw.h
>> @@ -814,6 +814,59 @@ struct ath10k_hw_ops {
>>  #define QCA9887_EEPROM_ADDR_LO_MASK            0x00ff0000
>>  #define QCA9887_EEPROM_ADDR_LO_LSB             16
>>
>> +#define MBOX_RESET_CONTROL_ADDRESS             0x00000000
>> +#define MBOX_HOST_INT_STATUS_ADDRESS           0x00000800
>> +#define MBOX_HOST_INT_STATUS_ERROR_LSB         7
>> +#define MBOX_HOST_INT_STATUS_ERROR_MASK                0x00000080
>
> I would again suggest using Jakub's bitfield GET_FIELD stuff to get
> rid of MASK+LSB and just have single define per register field. Kalle,
> thoughts?

Same comment as with the other patch, very much preferred but not a hard
requirement.

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
