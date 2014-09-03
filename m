Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XPC3X-0006iN-3U
 for ath10k@lists.infradead.org; Wed, 03 Sep 2014 15:01:08 +0000
Message-ID: <54072D19.7010809@candelatech.com>
Date: Wed, 03 Sep 2014 08:00:41 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: WMI version handling
References: <1407261537-11308-1-git-send-email-greearb@candelatech.com>
 <87zjehjkmg.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87zjehjkmg.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: ath10k@lists.infradead.org

On 09/02/2014 11:14 PM, Kalle Valo wrote:
> Hi,
> 
> This was "[PATCH] ath10k: Support 32+ stations." but I'll change the
> subject as this a bigger discussion. I'll also drop linux-wireless for
> now, I assume they are not interested about our discussion how to manage
> firmware interfaces.
> 
> greearb@candelatech.com writes:
> 
>> From: Ben Greear <greearb@candelatech.com>
>>
>> Implement 64-bit vdev map to support larger numbers
>> of virtual devices.  Support up to 32 stations
>> (actual limit will be determined when loading firmware,
>> as different firmwares have different limits)
>>
>> Enable larger limits when using Candela Technologies
>> firmware.
>>
>> Signed-off-by: Ben Greear <greearb@candelatech.com>
> 
> So what this firmware does is that it changes these values:
> 
>> +/* Over-rides for Candela Technologies firmware */
>> +#define TARGET_10X_NUM_VDEVS_CT			32
>> +#define TARGET_10X_NUM_PEERS_CT			(32 + (TARGET_10X_NUM_VDEVS_CT))
>> +#define TARGET_10X_AST_SKID_LIMIT_CT		(TARGET_10X_NUM_PEERS_CT * TARGET_10X_NUM_PEER_AST)

My firmware really makes better use of resources and is able to deal better with
a wider range of configured values.

For a full list of ath10k patches that I hope to someday submit, see:

http://dmz2.candelatech.com/git/gitweb.cgi?p=linux.ath/.git;a=summary

Towards the end, I have patches to configure number of stations with
kernel module variable.  I think at a minimum, should be able to configure
peer count as well.

> I think it would be better to provide these through FW IEs, one u32 for
> each. I guess we need one also for the skid limit? That way it's easier
> to maintain this in ath10k.

Skid limit should depend on the others.  If you get unlucky with hashes,
or an attacker figures out how to do so artificially, then you can crash
upstream ath10k firmware by associating more than skid-limit stations.

> Of course that would mean we have to create struct ieee80211_iface_limit
> and struct ieee80211_iface_combination runtime, instead of statically
> how it's done now. But shouldn't be a problem, right?

Yes, I do that later in my patch series.  It works, my patches as written
may need some changes as I had to remove some const markings that might not
be acceptable upstream.

> Also I have been thinking that using firmware feature bits (for example
> ATH10K_FW_FEATURE_WMI_10_2 and ATH10K_FW_FEATURE_WMI_10X) for WMI
> version is not the best way. I think it's easier to manage all this if
> we have a u32 FW IE to provide WMI version. IIRC Ben was suggesting this
> at some point.
> 
> Example:
> 
> enum ath10k_fw_wmi_version {
> 	ATH10K_FW_WMI_VERSION_MAIN = 0,
> 	ATH10K_FW_WMI_VERSION_10_1 = 1,
> 	ATH10K_FW_WMI_VERSION_10_2 = 2,
> }
> 
> And then wmi.c would set correct interface based on this version.

I am happy with the current flags, it seems to work well enough.
I'd leave policy out of the IEs as much as possible, as normal users
cannot modify it, and certainly it would be a problem if you wanted
different policy with different NICs in same system.
IEs should describe the minimum needed for the
ath10k to enforce policy as best as it can.  We have to assume that
users tweaking station and peer count can deal with fw crashes until
they get the settings right.

My CT firmware will print out available RAM once booted, so it is
fairly easy to utilize maximum amount of resources with a bit of
trial and error.  It would be trivial to make upstream firmware do
the same, of course, but upstream firmware may crash for other
reasons as you change resource config...

> We would still use feature bits to enable and disable smaller changes
> like ATH10K_FW_FEATURE_HAS_WMI_MGMT_TX does. But for bigger WMI changes
> we would change the WMI version, for example if we have a new firmware
> branch with significant changes or similar.
> 
> And for backwards comptability we need to do so that
> ATH10K_FW_FEATURE_WMI_10X sets ATH10K_FW_WMI_VERSION_10_1 and
> ATH10K_FW_FEATURE_WMI_10_2 sets ATH10K_FW_WMI_VERSION_10_2.

I was able to do all of my changes w/out needing new a new WMI version,
and I think that is the right approach.  I do not like large amounts of
duplicated code and table lookups, which is what new WMI versions appear
to imply.

I'd prefer to keep IEs generally as they are now (in my firmware,
at least), and allow changing number of peers, stations, etc through debugfs
and/or kernel modules.  Just restart the firmware when users have completed
the config changes.  Don't assume ath10k can properly limit all configurables
to keep firmware from crashing, but give users enough info (ie, RAM usage),
that they can deal with it themselves.  Normal users will never need to know
about or change the configurables anyway, but those building APs can tweak
as needed.

If QCA goes to more of a rolling release for firmware, like I do for CT
firmware, then we may want to add IEs a bit more often, to notify things like
"can-support-feature-foo".  10.2 v/s 10.1 can still determine the
over-all WMI api, perhaps, but at specific points we can take advantage of
specific firmware features based on IE flag.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
