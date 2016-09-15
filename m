Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkaYo-0003k8-VS
 for ath10k@lists.infradead.org; Thu, 15 Sep 2016 17:34:56 +0000
From: "Grumbach, Emmanuel" <emmanuel.grumbach@intel.com>
Subject: Re: [PATCH v2 09/21] ath10k: print fw debug messages in hex.
Date: Thu, 15 Sep 2016 17:34:29 +0000
Message-ID: <1473960869.31073.15.camel@intel.com>
References: <1462986153-16318-1-git-send-email-greearb@candelatech.com>
 <1462986153-16318-10-git-send-email-greearb@candelatech.com>
 <87oa3qefac.fsf@kamboji.qca.qualcomm.com>
 <57D96910.2010608@candelatech.com>
 <87k2edb6kp.fsf@kamboji.qca.qualcomm.com>
 <a26dfea0-9a18-69fc-e23c-cb223490822d@candelatech.com>
In-Reply-To: <a26dfea0-9a18-69fc-e23c-cb223490822d@candelatech.com>
Content-Language: en-US
Content-ID: <AD56776D25CD0A4E9C118896DC773ECF@intel.com>
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
To: "greearb@candelatech.com" <greearb@candelatech.com>, "kvalo@qca.qualcomm.com" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Thu, 2016-09-15 at 08:14 -0700, Ben Greear wrote:
> On 09/15/2016 07:06 AM, Valo, Kalle wrote:
> > Ben Greear <greearb@candelatech.com> writes:
> > 
> > > On 09/14/2016 07:18 AM, Valo, Kalle wrote:
> > > > greearb@candelatech.com writes:
> > > > 
> > > > > From: Ben Greear <greearb@candelatech.com>
> > > > > 
> > > > > This allows user-space tools to decode debug-log
> > > > > messages by parsing dmesg or /var/log/messages.
> > > > > 
> > > > > Signed-off-by: Ben Greear <greearb@candelatech.com>
> > > > 
> > > > Don't tracing points already provide the same information?
> > > 
> > > Tracing tools are difficult to set up and may not be available on
> > > random embedded devices.  And if we are dealing with bug reports
> > > from
> > > the field, most users will not be able to set it up regardless.
> > > 
> > > There are similar ways to print out hex, but the logic below
> > > creates
> > > specific and parseable logs in the 'dmesg' output and similar.
> > > 
> > > I have written a tool that can decode these messages into useful
> > > human-readable
> > > text so that I can debug firmware issues both locally and from
> > > field reports.
> > > 
> > > Stock firmware generates similar logs and QCA could write their
> > > own decode logic
> > > for their firmware versions.
> > 
> > Reinventing the wheel by using printk as the delivery mechanism
> > doesn't
> > sound like a good idea. IIRC Emmanuel talked about some kind of
> > firmware
> > debugging framework, he might have some ideas.
> 
> Waiting for magical frameworks to fix problems is even worse.
> 
It has been years since ath10k has been in the kernel.  There is
> basically
> still no way to debug what the firmware is doing.
> 

I know the feeling :) I was in the same situation before I added stuff
for iwlwifi.

> My patch gives you something that can work right now, with the
> standard 'dmesg'
> framework found in virtually all kernels new and old, and it has been
> proven
> to be useful in the field.  The messages are also nicely interleaved
> with the
> rest of the mac80211 stack messages and any other driver messages, so
> you have
> context.
> 
> If someone wants to add support for a framework later, then by all
> means, post
> the patches when it is ready.

From my experience, a strong and easy-to-use firmware debug
infrastructure is important because typically, the firmware is written
by other people who have different priorities (and are not always Linux
wizards) etc... Being able to give them good data is the only way to
have them fix their bugs :) For us, it was really a game changer. When
you work for a big corporate, having 2 groups work better together
always has a big impact. That's for the philosophical part :)

FWIW: what I did has nothing to do with FW 'live tracing', but with
firmware dumps. One part of our firmware dumps include tracing. We also
have "firmware prints", but we don't print them in the kernel log and
they are not part of the firmware dump thing. We rather record them in
tracepoints just like really *anything* that comes from the firmware.
Basically, we have 2 layers, the transport layer (PCIe) and the
operation_mode layer. The first just brings the data from the firmware
and in that layer we *blindly* record everything in tracepoints. In the
operation_mode layer, we look at the data itself. In case of debug
prints from the firmware, we simply discard them, because we don't
really care of the meaning. All we want is to have them go through the
PCIe layer so that they are recorded in the tracepoints.
When we finish recording the sequence we wanted with tracing (trace
-cmd), we parse the output and then, we parse the firmware prints.
IMHO, this is more reliable than kernel logs and you don't lose the
alignment with the driver traces as long as you have driver data in
tracepoints as well.

> 
> Thanks,
> Ben
> 
> 
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
