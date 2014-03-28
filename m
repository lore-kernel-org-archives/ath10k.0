Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTXR8-0006i0-9A
 for ath10k@lists.infradead.org; Fri, 28 Mar 2014 14:07:11 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v5] ath10k: implement per-VDEV FW statistics
References: <20140328132849.31620.78501.stgit@potku.adurom.net>
 <CA+BoTQmqf8kryKEeD00P6o+N7C+980pEqHnT9qe4H4cjZ+eb=w@mail.gmail.com>
Date: Fri, 28 Mar 2014 16:06:42 +0200
In-Reply-To: <CA+BoTQmqf8kryKEeD00P6o+N7C+980pEqHnT9qe4H4cjZ+eb=w@mail.gmail.com>
 (Michal Kazior's message of "Fri, 28 Mar 2014 14:53:40 +0100")
Message-ID: <87wqfev2ml.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 28 March 2014 14:28, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> From: Bartosz Markowski <bartosz.markowski@tieto.com>
>>
>> The WMI_REQUEST_PEER_STAT command with latest (999.999.0.716) FW
>> can return per-VDEV statistics. Using debugfs we can fetch this info now.
>>
>> This is a backward compatible change. In case of older FW the VDEV
>> statistics are simply not returned.
>>
>> kvalo: remove struct wmi_peer_stats_common cast from
>> ath10k_debug_read_target_stats()
>
> I just glanced over the patch and I don't think this is correct.
>
> Firmware 10.1.467 has peer_rx_rate but doesn't seem to have vdev stats.

Ok, I need to take a closer look at this. If someone else wants to look
at this instead, feel free to do that :)

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
