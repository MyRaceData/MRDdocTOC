import Component from "@glimmer/component";
import { service } from "@ember/service";
import { apiInitializer } from "discourse/lib/api";

const TARGET_SLUG = "trakbox-help"; // e.g. "trakbox-help"

class CategoryOnly extends Component {
  @service router;

  get shouldShow() {
    const route = this.router.currentRoute;
    return (
      route?.name === "discovery.category" &&
      route.attributes?.category?.slug === TARGET_SLUG
    );
  }

  <template>
    {{#if this.shouldShow}}
        <div style="margin-bottom: 24px;">
            <!-- Table of Contents -->
            <div style="white-space: nowrap; padding-bottom: 10px; background-color: rgb(0,0,0,.5); height: 100%;">
                <h2>Racing TrackBox Help</h2>
                <h3>Table of Contents</h3>
                <div>
                  <span>First Time Use? Check out the </span>
                  <a href="https://community.myracedata.com/t/getting-started-guide/344"> Quick Start Guide</a>
                </div><br>
                <div>
                  <span>What is the Racing TrakBox </span>
                  <a href="https://community.myracedata.com/t/trakbox-introduction-video/60"> Introduction Video</a>
                </div><br>
            </div>
        </div>
    {{/if}}
  </template>
}

export default apiInitializer((api) => {
  api.renderInOutlet("above-main-container", CategoryOnly);
});
