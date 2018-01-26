Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lf0-x22d.google.com ([2a00:1450:4010:c07::22d])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ef9Ps-00016r-Lr
 for ath10k@lists.infradead.org; Fri, 26 Jan 2018 19:12:02 +0000
Received: by mail-lf0-x22d.google.com with SMTP id o89so1942961lfg.10
 for <ath10k@lists.infradead.org>; Fri, 26 Jan 2018 11:11:46 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87lgglufls.fsf@kamboji.qca.qualcomm.com>
References: <CAFR5RwTCNV-135E16fXJLECsart-cTjVJq8QcDB3wKH+JrsHnw@mail.gmail.com>
 <87lgglufls.fsf@kamboji.qca.qualcomm.com>
From: Adam Porter <porter.adam@gmail.com>
Date: Fri, 26 Jan 2018 11:11:44 -0800
Message-ID: <CAFR5RwRh3W4GFLz3C9PGRCQA-hv40HqtAU-43P17n6pL69aK6w@mail.gmail.com>
Subject: Re: QCA6174 SDIO crashing after few days
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org

On Fri, Jan 26, 2018 at 1:35 AM, Kalle Valo <kvalo@codeaurora.org> wrote:
> Adam Porter <porter.adam@gmail.com> writes:
>
>> Firmware WLAN.RMH.4.1.1-00014-QCARMSWPZ-1
>>
>> Using branch ath10k-pending-sdio-usb
>
> What commit id? BTW, I'm planning to add a tag everytime I rebase that
> branch so that it's easier to find older commits and identify what
> version is used.

I apologize for not having the specific id; I scrubbed the git info
when I added the code to my build system.
I grabbed the code when the branch was first published before any rebase.

>> I'm using this module as an access point. After a while of uptime, it
>> appears that all communication with the module ceases. Hostapd goes to
>> disassociate clients due to inactivity, then I see in the log the
>> resulting failures:
>>
>> [94216.098042] ath10k_sdio mmc0:0001:1: failed to install key for vdev
>> 0 peer c8:21:58:10:b3:b4: -110
>> [94219.170075] ath10k_sdio mmc0:0001:1: failed to install key for vdev
>> 0 peer b8:27:eb:f2:52:22: -110
>> [94219.191719] ath10k_sdio mmc0:0001:1: cipher 0 is not supported
>> [94219.207948] ath10k_sdio mmc0:0001:1: failed to remove peer wep key 0: -95
>> [94219.222155] ath10k_sdio mmc0:0001:1: failed to clear all peer wep
>> keys for vdev 0: -95
>> [94219.237937] ath10k_sdio mmc0:0001:1: failed to disassociate
>> station: c8:21:58:10:b3:b4 vdev 0: -95
>>
>> It seems that I can reproduce this issue faster by connecting more
>> clients and pushing a lot of throughput. So perhaps this is a resource
>> leak in the firmware?
>
> I would blame ath10k first :) Can you estimate how much data needs to be
> transferred before this happens?

It varies wildly. I've entered this state after 24 hours of pinging
google, but on another test
it took more than 48 hours with tens of gigabytes of data transferred.
In general though, the more data being transmitted from AP to clients
the more likely
this issue will appear.

During debugging I found that having ATH10K_DBG_SDIO_DUMP enabled when
using iperf to send data from AP to client triggers this state almost
immediately.
Receiving data from client to AP doesn't seem to trigger this.
Not sure if this is related or some other issue.

Thank you,
Adam

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
