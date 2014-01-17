Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W45eX-0003ao-2h
 for ath10k@lists.infradead.org; Fri, 17 Jan 2014 09:23:50 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: enable firmware STA quick kickout
References: <20140116123336.24551.2629.stgit@potku.adurom.net>
 <CAOiHx=n77=CiFYfB3Y=jxOjVtmr06zvFhUe5R96Kq0HUgSLv5Q@mail.gmail.com>
Date: Fri, 17 Jan 2014 11:23:22 +0200
In-Reply-To: <CAOiHx=n77=CiFYfB3Y=jxOjVtmr06zvFhUe5R96Kq0HUgSLv5Q@mail.gmail.com>
 (Jonas Gorski's message of "Fri, 17 Jan 2014 10:01:06 +0100")
Message-ID: <871u07rmgl.fsf@kamboji.qca.qualcomm.com>
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
To: Jonas Gorski <jogo@openwrt.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

Jonas Gorski <jogo@openwrt.org> writes:

> On Thu, Jan 16, 2014 at 1:33 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Firmware has a feature to track if the associated STA is not acking the frames.
>> When that happens, the firmware sends WMI_PEER_STA_KICKOUT_EVENTID event to the
>> host. Enable that to faster detect when a STA has left BSS without sending a
>> deauth frame.
>>
>> Also set huge keepalive timeouts to avoid using the keepalive functionality in
>> the firmware.
>>
>> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

[...]

>> +       param = ar->wmi.pdev_param->sta_kickout_th;
>> +       ret = ath10k_wmi_pdev_set_param(ar, param,
>> +                                       ATH10K_KICKOUT_THRESHOLD);
>> +       if (ret) {
>> +               ath10k_warn("Failed to enable sta kickout: %d\n", ret);
>> +               return ret;
>> +       }
>> +
>> +       param = ar->wmi.vdev_param->ap_keepalive_min_idle_inactive_time_secs;
>> +       ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, param,
>> +                                       ATH10K_KEEPALIVE_MIN_IDLE);
>> +       if (ret) {
>> +               ath10k_warn("Failed to enable sta kickout: %d\n", ret);
>> +               return ret;
>> +       }
>> +
>> +       param = ar->wmi.vdev_param->ap_keepalive_max_idle_inactive_time_secs;
>> +       ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, param,
>> +                                       ATH10K_KEEPALIVE_MAX_IDLE);
>> +       if (ret) {
>> +               ath10k_warn("Failed to enable sta kickout: %d\n", ret);
>> +               return ret;
>> +       }
>> +
>> +       param = ar->wmi.vdev_param->ap_keepalive_max_unresponsive_time_secs;
>> +       ret = ath10k_wmi_vdev_set_param(ar, arvif->vdev_id, param,
>> +                                       ATH10K_KEEPALIVE_MAX_UNRESPONSIVE);
>> +       if (ret) {
>> +               ath10k_warn("Failed to enable sta kickout: %d\n", ret);
>> +               return ret;
>> +       }
>
> Did you intend to have differing warnings here? Currently it will be
> hard to tell which of these calls have failed based on the warning
> (assuming ath10k_warn does not print the source code line it was
> invoked from).

You are right, all warning/error messages in ath10k should be unique so
that the location can be easily found. I was actually supposed to fix
this before I send it for review, but apparently I forgot. I'll send v2.

Thanks!

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
